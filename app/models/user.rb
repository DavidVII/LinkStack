class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  VALID_USERNAME_REGEX = /\A[a-zA-Z0-9_]*[a-zA-Z][a-zA-Z0-9_]*\z/
  validates :username, presence: true, length: { minimum: 2, maximum: 50 },
                       uniqueness: { case_sensitive: false },
                       format: { with: VALID_USERNAME_REGEX }

  has_many :stacks
end
