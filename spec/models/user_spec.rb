require 'spec_helper'

describe User do
  before do
    @user = User.new(
      username: 'ExampleUser',
      email: "user@example.com",
      password: "foobar1",
      password_confirmation: "foobar1"
    )
  end

  subject { @user }

  it { should respond_to(:username) }
  it { should respond_to(:email) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:encrypted_password) }
  it { should respond_to(:reset_password_token) }
  it { should respond_to(:reset_password_sent_at) }
  it { should respond_to(:remember_created_at) }
  it { should respond_to(:sign_in_count) }
  it { should respond_to(:current_sign_in_at) }
  it { should respond_to(:last_sign_in_at) }
  it { should respond_to(:current_sign_in_ip) }
  it { should respond_to(:last_sign_in_ip) }

  it { should be_valid }

  describe "when username is not present" do
    before { @user.username = " " }
    it { should_not be_valid }
  end

  describe "when a username is too short" do
    before { @user.username = "a" }
    it { should_not be_valid }
  end

  describe "when a username is too long" do
    before { @user.username = "a" * 51 }
    it { should_not be_valid }
  end

  describe "when a username is already taken" do
    before do
      user_with_the_same_username = @user.dup
      user_with_the_same_username.email = "different@email.com"
      user_with_the_same_username.username = @user.username.upcase
      user_with_the_same_username.save
    end

    it { should_not be_valid }
  end

  describe "when an email is not present" do
    before { @user.email = " " }
    it { should_not be_valid }
  end

  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[ user@foo,com user_at_foo.org example.user@foo. foo2example.com example@somecom ]
      addresses.each do |invalid_address|
        @user.email = invalid_address
        @user.should_not be_valid
      end
    end
  end

  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[ user@foo.COM A_US-ER@f.b.org first.lst@foo.jp a+b@baz.cn ]
      addresses.each do |valid_address|
        @user.email = valid_address
        @user.should be_valid
      end
    end
  end

  describe "when email address is already taken" do
    before do
      user_with_the_same_email = @user.dup
      user_with_the_same_email.email = @user.email.upcase
      user_with_the_same_email.save
    end

    it { should_not be_valid }
  end

  describe "when the password is not preset" do
    before { @user.password = @user.password_confirmation = " " }
    it { should_not be_valid }
  end

  describe "when the password confirmation doesn't match" do
    before { @user.password_confirmation = "mismatch" }
    it { should_not be_valid }
  end

  describe "when the password is too short" do
    before { @user.password = @user.password_confirmation = "a" * 6 }
    it { should_not be_valid }
  end
end
