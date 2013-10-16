module ApplicationHelper

  def full_title(page_title)
    base_title = 'LinkStack'

    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  # Get devise forms on homepage
  def resource_name
    :user
  end
 
  def resource
    @resource ||= User.new
  end
 
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end
