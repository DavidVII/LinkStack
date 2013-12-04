class PagesController < ApplicationController
  def index
    redirect_to stacks_path if user_signed_in?
  end

  def about
  end
end
