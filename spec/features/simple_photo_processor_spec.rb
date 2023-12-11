require_relative '../spec_helper'

feature "Simple Photo Processor:", js: true do
  scenario "navigating to the photo processor" do
    # ALWAYS check that the page that you are testing can actually be reached
    # via. the human-readable navigation!
    visit "/"
    click_link "Simple Photo Processor"
    page.should have_content "Simple Photo Processor Upload Page"
    page.current_path.should eq "/simple_photo_processor/new"
  end

  scenario "uploading a JPEG transforms the image" do
    visit "/simple_photo_processor/new"
    test_image_filename = 'postive_possum_shirt.jpeg'
    upload_image_and_check_for_errors(test_image_filename)
    verify_that_image_has_been_transformed(test_image_filename)
  end

  scenario "uploading a PNG with alpha transparency transforms the image" do
    visit "/simple_photo_processor/new"
    test_image_filename = 'rose_hulman_website.png'
    upload_image_and_check_for_errors(test_image_filename)
    verify_that_image_has_been_transformed(test_image_filename)
  end

  scenario "uploading no image", skip: "implement this for extra credit :)" do
    visit "/simple_photo_processor/new"
    click_button "Upload"
    page.should have_text "Error"
    page.should have_text "Select an image file to upload"
    page.should have_text "Please upload an image file"
  end

  scenario "non images are not allowed", skip: "implement this for extra credit :)" do
    test_non_image_filename = 'not_actually_an_image.jpg'
    visit "/simple_photo_processor/new"
    attach_file 'Select an image to upload', File.join(SINATRA_ROOT, 'spec', 'support', test_image_filename)
    click_button 'Upload'
    page.should have_text "Select an image file to upload"
    page.should have_text "Please upload a valid image file"
  end
end

## Helpers Specific To These Tests:

def upload_image_and_check_for_errors(test_image_filename)
  visit "/simple_photo_processor/new"
  attach_file 'Select an image to upload', File.join(SINATRA_ROOT, 'spec', 'support', test_image_filename)
  click_button 'Upload'
  page.should_not have_content("Error")
end

def verify_that_image_has_been_transformed(test_image_filename)
  allegedly_transformed_image_as_seen_by_browser_path = Capybara.save_screenshot
  allegedly_transformed_image = Magick::ImageList.new(allegedly_transformed_image_as_seen_by_browser_path)

  original_image_path = File.join(SINATRA_ROOT, 'spec', 'support', test_image_filename)
  Capybara.current_session.driver.visit "file:///" + original_image_path
  original_image_as_seen_by_browser_path = Capybara.save_screenshot
  original_image = Magick::ImageList.new(original_image_as_seen_by_browser_path)


  difference_array = original_image.difference(allegedly_transformed_image)
  # difference_array is composed of mean_error_per_pixel, normalized_mean_error, normalized_maximum_error
  difference_array.sum.should be > 0
end
