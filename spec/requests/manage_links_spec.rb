require 'spec_helper'

feature 'Manage Links' do

  let(:user) { FactoryGirl.create(:user) }

  before do
    sign_in user
    visit root_path
    create_stack
    visit stack_path(Stack.last)
  end

  scenario 'create new link' do
    fill_in('URL', with: 'http://google.com')
    fill_in('Description', with: 'Description example')
    click_button('Save')

    expect(page).to have_content('http://google.com')
    expect(page).to have_content('Description example')
  end
end
