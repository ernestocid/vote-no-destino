class User < ApplicationRecord
  validates :name, presence: true, email_format: true
  validates :email, presence: true, uniqueness: true
end
