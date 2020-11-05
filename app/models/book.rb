class Book < ApplicationRecord

  # association
  belongs_to :user

  # validation
  validates :title, presence: true
  validates :body, length: { in: 1..200 }
end
