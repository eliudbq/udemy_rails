class Article < ApplicationRecord
  belongs_to :user
  validates :titulo, presence: true, length: { minimum: 10, maximum: 25 }
  validates :texto, presence: true, length: { minimum: 10, Maximum: 500 }
  validates :categoria, presence: true, length: { minimum: 5, Maximum: 10 }
  validates :user_id, presence: true
  validates :precio, presence: true, length: { minimum: 2, Maximum: 5 }
end
