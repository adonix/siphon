require 'spec_helper'

describe "Authentication" do

  subject { page }

  describe "login page" do
    before { visit login_path }

    it { should have_content('Login') }
    it { should have_title('Login') }
  end

  describe 'logging in' do
    before { visit login_path }

    describe 'with invalid credentials' do
      before { click_button 'Log In'}

      it { should have_title('Login') }
      it { should have_selector('div.alert.alert-error') }

      describe 'after visiting another page' do
        before { click_link 'Siphon' }
        it { should_not have_selector('div.alert.alert-error') }
      end
    end

    describe 'with valid credentials' do
      let(:user) { FactoryGirl.create(:user) }

      before do
        fill_in 'session_email',     with: user.email.upcase
        fill_in 'session_password',  with: user.password
        click_button 'Log In'
      end

      it { should have_title(user.name) }
      it { should have_link('Me',         href: '#') }
      it { should have_link('Log Out',    href: logout_path) }
      it { should_not have_link('Log In', href: login_path) }

      describe 'followed by log out' do
        before { click_link 'Log Out' }
        it { should have_link('Log In') }
        it { should have_link('Join', href: join_path)}
      end
    end
  end
end
