require 'spec_helper'

describe "User Pages" do

  subject { page }

  describe "join page" do
    before { visit join_path }

    it { should have_content('Join') }
    it { should have_title('Join') }
  end
end
