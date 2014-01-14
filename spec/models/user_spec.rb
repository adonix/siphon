require 'spec_helper'

describe User do
  before { @user = User.new(name: "Enrique Figueroa", email: "efigueroa@example.com",
                            password: "freddy" , password_confirmation: "freddy") }

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:authenticate) }
  it { should be_valid }

  describe "when name is not present" do
    before { @user.name = " " }
    it { should_not be_valid }
  end

  describe "when email is not present" do
    before { @user.email = " " }
    it { should_not be_valid }
  end

  describe "when name is too long" do
    before { @user.name = "a" * 61 }
    it { should_not be_valid }
  end

  describe "when email format is invalid" do
    it 'should be invalid' do
      addresses = %w[user_at_company.org user@fred,com user@fred@dog.org user@fred+dog.com]
      addresses.each do |invalid_address|
        @user.email = invalid_address
        expect(@user).not_to be_valid
      end
    end

  end

  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[user@fred.com user_123_Dog@fred.dog.cn user.fred@baja.mx fred+dog@osaka.jp ]
      addresses.each do |valid_address|
        @user.email = valid_address
        expect(@user).to be_valid
      end

    end
  end

  describe "when email address is already taken" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.email = @user.email.upcase
      user_with_same_email.save
    end

    it { should_not be_valid }
  end

  describe "when password is not present" do
    before do
      @user = User.new(name: "user1", email: "user1@exmaple.com",
                       password: " ", password_confirmation: " ")
    end
      it { should_not be_valid }
  end

  describe "when password does not match confirmation" do
    before { @user.password_confirmation = "wrong" }
    it { should_not be_valid }
  end

  describe "return value of authenticate method" do
    before { @user.save }
    let(:found_user) { User.find_by(email: @user.email) }

    describe "with valid password" do
      it { should eq found_user.authenticate(@user.password)}
    end

    describe "with invalid password" do
      let(:user_with_invalid_password) { found_user.authenticate("invalid") }

      it { should_not eq user_with_invalid_password }
      specify { expect(user_with_invalid_password).to be_false }
    end
  end

  describe "with a password that's too short" do
    before { @user.password = @user.password_confirmation = "a" * 5 }
    it { should_not be_valid }
  end
end
