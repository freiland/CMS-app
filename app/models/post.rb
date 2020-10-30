class Post < ApplicationRecord
  has_many :comments, dependent: :destroy

  validates :content_body, presence: true
end