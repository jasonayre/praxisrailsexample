
require 'praxis/mapper/active_model_compat'
class User < ApplicationRecord
  include Praxis::Mapper::ActiveModelCompat
  has_many :posts, foreign_key: :user_id, class_name: 'Post', inverse_of: :author
  has_many :comments, dependent: :destroy
end
