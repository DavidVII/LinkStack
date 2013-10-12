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

  describe "when name is not present" do
    before { @user.username = " " }
    it { should_not be_valid }
  end
end
