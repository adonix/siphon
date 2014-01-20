require 'spec_helper'

describe "User Pages" do

  subject { page }

  describe "join page" do
    before { visit join_path }

    it { should have_content('Join') }
    it { should have_title('Join') }
  end

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }

    it { should have_content(user.name) }
    it { should have_title(user.name) }
  end

  describe "join page" do

    before { visit join_path }

    let(:submit) { "Join"}

    describe "with invalid information" do
      it 'should not create a new user account' do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "user_name",                   with: "John Doe"
        fill_in "user_email",                  with: "jdoe@somecompany.com"
        fill_in "user_password",               with: "foobar"
        fill_in "user_password_confirmation",  with: "foobar"
      end

      it 'should create a new user account' do
        expect { click_button submit }.to change(User, :count).by(1)
      end
    end
  end
end
