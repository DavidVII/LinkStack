require 'spec_helper'

describe "Pages" do
  subject { page }

  describe "Home page" do
    before { visit root_path }

    it { should have_title('Welcome to LinkStack!') }
    it { should have_content('LinkStack') }
    it { should have_link('Login', href: '#') }
    it { should have_link('Sign up today!', href: '#') }
  end
end
