require 'spec_helper'

describe 'StackPages' do
  subject { page }

  let(:user) { FactoryGirl.create(:user) }

  before { sign_in user }

  describe 'new stack page' do
    before { visit new_stack_path }

    describe 'when a user is signed in' do
      it 'creates a new stack' do
        expect {
          fill_in 'stack_name', with: 'Stack Name'
          fill_in 'stack_description', with: 'Stack Description'
          click_button 'Create'
        }.to change(Stack, :count).by(1)

        expect(page).to have_content('Stack Name')
        expect(page).to have_content('Stack Description')
        expect(page).to have_content(user.username)
      end
    end
  end
end
