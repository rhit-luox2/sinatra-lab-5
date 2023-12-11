require_relative '../spec_helper'

# This test is here to show you the differences between testing with rack::test and testing with selenium!
# Rack::Test is fastest (b/c it doesn't run in a real browser), Selenium is most accurate
feature "loading the homepage" do
  scenario "using old-school rack test" do
    visit "/"
    expect(page).to have_content "Hello, World!"
    expect(page).not_to have_content "This message brought to you by JavaScript"
  end

  scenario "using selenium to test in a real browser", js: true do
    visit "/"
    expect(page).to have_content "Hello, World!"
    expect(page).to have_content "This message brought to you by JavaScript"
  end
end
