include ApplicationHelper

def sign_in(user)
  visit new_user_session_path
  fill_in "Email", with: user.email
  fill_in "Password", with: user.password
  click_button "Sign in"
end

def create_stack
  visit new_stack_path
  fill_in 'Name', with: 'Stack Example'
  fill_in 'Description', with: 'Stack Description'
  click_button 'Create'
end
