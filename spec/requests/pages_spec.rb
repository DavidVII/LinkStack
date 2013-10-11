require 'spec_helper'

describe "Pages" do
  describe "Home page" do
    it "Should have content 'LinkStack'" do
      visit '/pages/index'
      expect(page).to have_content('LinkStack')
    end
  end
end
