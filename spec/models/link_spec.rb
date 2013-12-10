require 'spec_helper'

describe Link do
  let(:user) { FactoryGirl.create(:user) }
  let(:stack) { FactoryGirl.create(:stack) }

  before do
    @link = Link.create(
      url: 'http://google.com',
      description: 'Example Link Description',
      user_id: user.id,
      stack_id: stack.id
    )
  end

  subject { @link }

  it { should respond_to(:url) }
  it { should respond_to(:description) }
  it { should respond_to(:user_id) }
  it { should respond_to(:stack_id) }

  it { should belong_to(:user) }
  it { should belong_to(:stack) }
  its(:user) { should == user }
  its(:stack) { should == stack }

  it { should be_valid }

  describe 'when a url is not present' do
    before { @link.url = ' ' }
    it { should_not be_valid }
  end

  describe 'when a description is not present' do
    before { @link.description = ' ' }
    it { should be_valid }
  end

  describe "with a description that is too long" do
    before { @link.description = "a" * 256 }
    it { should_not be_valid }
  end

  describe 'when a user is not present' do
    before { @link.user = nil }
    it { should_not be_valid }
  end

  describe 'when a stack is not present' do
    before { @link.stack = nil }
    it { should_not be_valid }
  end
end
