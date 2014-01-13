require 'spec_helper'

describe "Site Index Pages" do

  describe "Home page" do

    it "Should have the content 'Siphon'" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      #get site_index_pages_index_path
      #response.status.should be(200)
      visit root_path
      expect(page).to have_content('Siphon')
    end
  end

  describe "Upload page" do
    before { visit upload_path }

    it "should have the content 'Upload'" do
      expect(page).to have_content('Upload')
    end

    it "should have the title 'Upload'" do
      expect(page).to have_title('Siphon, Your Videos At Your Finger Tips | Upload')
    end
  end

  describe "Login page" do
    before { visit login_path }

    it "should have content 'Login'" do
      expect(page).to have_content('Login')
    end

    it "should have the title 'Login'" do
      expect(page).to have_title('Siphon, Your Videos At Your Finger Tips | Login')
    end
  end
end
