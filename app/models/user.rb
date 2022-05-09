class User < ApplicationRecord
  has_many :articles
  #validates :name, presence: true, uniqueness: { case_sensitive: true }, length: { minimum: 10, maximum: 25 }
  EMAIL_REGEX = /A([^@s]+)@((?:[-a-z0-9]+.)+[a-z]{2,})z/i
  # validates_format_of :mail, with: EMAIL_REGEX
  #validates :mail, presence: true, uniqueness: true, length: { maximum: 50 }
  has_secure_password
end