module Features
  module SessionHelpers
    def sign_up_with(username, email, password)
     fill_in 'user_username', with: username
     fill_in 'user_email', with: email
     fill_in 'user_password', with: password
     fill_in 'user_password_confirmation', with: password
     click_button 'Sign up'
    end
  end
end
