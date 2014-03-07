require 'spec_helper'

feature 'Manage Links' do

  let(:user) { FactoryGirl.create(:user) }

  before do
    sign_in user
    visit root_path
    create_stack
    visit stack_path(Stack.last)
  end

  let(:stack) { Stack.last }

  scenario 'create new link' do
    fill_in('URL', with: 'http://google.com')
    fill_in('Description', with: 'Description example')
    click_button('Save')

    expect(page).to have_css("#link_#{Link.last.id}")
    expect(page).to have_content('http://google.com')
    expect(page).to have_content('Description example')
  end

  scenario 'delete a link' do
    fill_in('URL', with: 'http://google.com')
    fill_in('Description', with: 'Description example')
    click_button('Save')

    within("#link_#{Link.last.id}") do
      click_link('Delete')
    end

    expect(page).to_not have_css("#link_#{Link.last}")
    expect(page).to have_content('deleted')
    expect(page).to have_css('h1.page-title', text: stack.name)
  end

  scenario 'adding a link without a URL' do
    fill_in('Description', with: 'Description example')
    click_button('Save')
    expect(page).to have_content("URL's are required")
  end
end
