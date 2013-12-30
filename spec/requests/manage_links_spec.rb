require 'spec_helper'

feature 'Manage Links' do

  let(:user) { FactoryGirl.create(:user) }

  before do
    sign_in user
    visit root_path
    create_stack
  end

  scenario 'create new link' do
    expect(page).to have_content('Stack Example')
  end
end
