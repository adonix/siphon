require 'spec_helper'

describe Video do

  let(:user) { FactoryGirl.create(:user) }
  before {
    @file = Rack::Test::UploadedFile.new(Rails.root.join('public/videos/juneau.mp4'), 'video/mp4')
    @video = user.videos.build(name: @file)
  }

  subject { @video }

  it { should have_attached_file(:name) }
  it { should validate_attachment_presence(:name) }
end
