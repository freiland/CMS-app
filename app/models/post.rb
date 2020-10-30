class Post < ApplicationRecord
  has_many :comments, dependent: :destroy

  validates :comment_body, presence: true
end