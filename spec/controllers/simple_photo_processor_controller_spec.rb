require_relative "../spec_helper"

def app
  SimplePhotoProcessorController
end

describe SimplePhotoProcessorController do

  def verify_that_image_has_been_transformed(test_image_path)
    # Verifying the Content-Type header:
    last_response.headers["Content-Type"].should == "image/png"

    allegedly_transformed_image = Magick::Image.from_blob(last_response.body).first
    original_image = Magick::ImageList.new(test_image_path)

    difference_array = original_image.difference(allegedly_transformed_image)
    # difference_array is composed of mean_error_per_pixel, normalized_mean_error, normalized_maximum_error
    difference_array.sum.should be > 0
  end

  describe 'POST /simple_photo_processor' do
    describe 'with a JPEG' do
      let(:test_image_path){ File.join(SINATRA_ROOT, 'spec', 'support', 'postive_possum_shirt.jpeg') }

      before do
        file_to_upload = Rack::Test::UploadedFile.new(test_image_path, "image/jpeg")
        post '/simple_photo_processor', imageUpload: file_to_upload
      end

      it "should resposnd with success" do
        # NOTE: last_response is a Rack::Response which includes nice helpers (see links):
        #                          https://www.rubydoc.info/gems/rack/Rack/Response
        #                          https://www.rubydoc.info/gems/rack/Rack/Response/Helpers
        last_response.ok?.should be_truthy
      end

      it "should transform the image" do
        verify_that_image_has_been_transformed(test_image_path)
      end
    end

    describe 'with an alpha transparency PNG' do
      let(:test_image_path){ File.join(SINATRA_ROOT, 'spec', 'support', 'rose_hulman_website.png') }

      before do
        file_to_upload = Rack::Test::UploadedFile.new(test_image_path, "image/jpeg")
        post '/simple_photo_processor', imageUpload: file_to_upload
      end

      it "should resposnd with successs" do
        last_response.ok?.should be_truthy
      end

      it "should transform the image" do
        verify_that_image_has_been_transformed(test_image_path)
      end
    end

    describe 'with non-image', skip: "implement this for extra credit :)" do
      before do
        test_image_path = File.join(SINATRA_ROOT, 'spec', 'support', 'not_actually_an_image.jpg')
        file_to_upload = Rack::Test::UploadedFile.new(test_image_path, "image/jpeg")
        post '/simple_photo_processor', imageUpload: file_to_upload
      end

      it "should respond with a client error" do
        last_response.bad_request?.should be_truthy
      end

      it "should include an appropriate error message in the response" do
        last_response.should have_text("Please upload a valid image file")
      end
    end

    describe 'with no image', skip: "implement this for extra credit :)" do
      before do
        post '/simple_photo_processor'
      end

      it "should respond with a client error" do
        last_response.bad_request?.should be_truthy
      end

      it "should include an appropriate error message in the response" do
        last_response.should have_text("Please upload an image file")
      end
    end
  end
end
