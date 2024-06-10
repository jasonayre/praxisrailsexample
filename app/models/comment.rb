class Comment < ApplicationRecord
  # Belongs to Post
  belongs_to :post

  # Belongs to User who made the comment
  belongs_to :user
end
