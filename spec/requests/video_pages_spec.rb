require 'spec_helper'

describe "Video Pages" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  describe "video creation" do
    # visit upload page and upload a video
    # visit newly create video page
    # delete video
  end
end
