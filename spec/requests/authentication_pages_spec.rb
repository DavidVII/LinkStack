require 'spec_helper'

describe "AuthenticationPages" do
  subject { page }

  describe "Home page" do
    before { visit root_path }

    describe "Sign up form" do
      it "Creates an account" do

        expect {
          fill_in 'Username', with: 'ExampleUser'
          fill_in 'Email', with: 'person@example.com'
          fill_in 'Password', with: 'foobar1'
          fill_in 'Password confirmation', with: 'foobar1'
          click_button 'Sign up'
        }.to change(User, :count).by(1)

        expect(page).to have_content "signed up successfully"
        expect(page).to have_link('Account', href: edit_user_registration_path)
        expect(page).to have_link('Sign Out', href: destroy_user_session_path)
        expect(page).to_not have_content "Sign up"
      end
    end
  end
end
