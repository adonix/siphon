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

      describe "after submission" do
        before { click_button submit }

        it { should have_title('Join') }
        it { should have_content('error') }
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

      describe "after joining or creating account" do
        before { click_button submit }
        let(:user) { User.find_by(email: "jdoe@somecompany.com") }

        it { should have_title(user.name) }
        it { should have_selector('div.alert.alert-success', text: 'Welcome') }
      end
    end
  end
end
