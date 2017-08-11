class Option < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  def self.build_random_combinations
    all.to_a.combination(2).to_a.shuffle!
  end
end
