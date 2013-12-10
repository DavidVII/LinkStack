class Link < ActiveRecord::Base
  belongs_to :user
  belongs_to :stack

  validates_presence_of :url, :user_id, :stack_id
  validates :description, length: { maximum: 255 }
end
