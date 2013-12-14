require 'spec_helper'

feature 'Manage Links' do
  let(:user) { FactoryGirl.create(:user) }

  before do
    sign_in(user)
    @stack = FactoryGirl.create(:stack, user: user)
  end

  scenario 'create a new link' do
    visit stack_path(@stack)
    expect(page).to have_content('Add New Link')

    fill_in 'url', with: 'http://example.com'
    fill_in 'description', with: 'Description example'
    click 'Save Link'

    expect(page).to have_link('http://example.com')
    expect(page).to have_content('Description example')
  end
end
