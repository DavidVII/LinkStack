require 'spec_helper'

describe 'StackPages' do
  subject { page }

  let(:user) { FactoryGirl.create(:user) }

  before { sign_in user }

  describe 'home page after user is signed in' do
    before { visit root_path }
    it { should have_link('New Stack', href: new_stack_path) }
    it { should have_link('My Stacks', href: stacks_path) }
  end

  describe 'stacks index page' do
    before { visit stacks_path }
    it { should have_content('Your Stacks') }
  end

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

  describe 'new stack form with empty fields' do
    before do
      visit new_stack_path
      fill_in 'stack_name', with: ''
      fill_in 'stack_description', with: ''
      click_button 'Create'
    end

    it { should have_content('error') }
  end

  describe 'stack descruction' do
    before { FactoryGirl.create(:stack, user: user) }

    describe 'as the correct user' do
      before { visit stacks_path }

      it 'should delete a stack' do
        expect { click_link 'Delete' }.to change(Stack, :count).by(-1)
        expect(page).to have_content('deleted')
      end
    end
  end
end
