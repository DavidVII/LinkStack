require 'spec_helper'

describe Stack do
  before do
    @stack = Stack.new(
      name: "Stack Name",
      description: "Lorem Ipspum"
    )
  end

  subject { @stack }

  it { should respond_to(:name) }
  it { should respond_to(:description) }

  it { should be_valid }

  describe 'when a name is not present' do
    before { @stack.name = ' ' }
    it { should_not be_valid }
  end

  describe 'when a description is not present' do
    before { @stack.description = ' ' }
    it { should be_valid }
  end

  describe 'aassociations' do
    it 'should have user'
  end
end
