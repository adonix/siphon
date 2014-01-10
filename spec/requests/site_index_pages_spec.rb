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
end
