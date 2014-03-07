require 'spec_helper'

feature 'visitor signs up' do
  scenario 'with a valid email and password' do
     visit root_path
     sign_up_with 'ExampleUser', 'person@example.com', 'foobar1'
     expect(page).to have_content('Sign Out')
  end

  scenario 'with an invalid username' do
    visit root_path
    sign_up_with 'Invali+User', 'valid@example.com', 'foobar1'
    expect(page).to have_content('Login')
  end

  scenario 'with an invalid email' do
    visit root_path
    sign_up_with 'ExampleUser', 'invalidemail', 'foobar1'
    expect(page).to have_content('Login')
  end

  scenario 'with a blank password' do
    visit root_path
    sign_up_with 'ExampleUser', 'valid@example.com', ''
    expect(page).to have_content('Login')
  end
end


