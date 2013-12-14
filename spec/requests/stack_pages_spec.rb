require 'spec_helper'

describe 'StackPages' do
  subject { page }

  let(:user) { FactoryGirl.create(:user) }

  before do
    sign_in(user)
    @stack = FactoryGirl.create(:stack, user: user)
  end

  describe 'user stacks should be displayed' do
    before { visit root_path }
    it { should have_content("Your Stacks") }
    it { should have_content(@stack.name) }
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
        expect { first('.stack').click_link 'Delete' }.to change(Stack, :count).by(-1)
        expect(page).to have_content('deleted')
      end
    end
  end
end
