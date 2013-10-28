require 'spec_helper'

describe Stack do

  let(:user) { FactoryGirl.create(:user) }

  before do
    @stack = user.stacks.build(
      name: "Stack Name",
      description: "Lorem Ipspum"
    )
  end

  subject { @stack }

  it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should respond_to(:user_id) }
  its(:user) { should == user }

  it { should be_valid }

  describe 'when a name is not present' do
    before { @stack.name = ' ' }
    it { should_not be_valid }
  end

  describe 'when a description is not present' do
    before { @stack.description = ' ' }
    it { should be_valid }
  end

  describe 'when a user is not present' do
    before { @stack.user = nil }
    it { should_not be_valid }
  end
end
