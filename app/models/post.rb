class Post < ApplicationRecord
  # Belongs to User, the author of the post
  belongs_to :author, class_name: 'User', foreign_key: :user_id

  # Association with comments
  has_many :comments, dependent: :destroy
end
