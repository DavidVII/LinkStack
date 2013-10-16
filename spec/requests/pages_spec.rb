require 'spec_helper'

describe "Pages" do
  subject { page }

  describe "Home page" do
    before { visit root_path }

    it { should have_title('LinkStack') }
    it { should have_content('LinkStack') }
    it { should have_link('Login', href: new_user_session_path) }
    it { should have_link('LinkStack', href: root_path) }
    it { should have_link('About', href: about_path) }
  end

  describe "About page" do
    before { visit about_path }

    it { should have_title('LinkStack | About') }
    it { should have_content('About LinkStack') }
  end
end
