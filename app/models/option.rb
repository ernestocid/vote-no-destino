class Option < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates_with MaxEntriesValidator
end
