class Option < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates_with MaxEntriesValidator, on: :create

  def delete
    begin
      self.destroy
    rescue
      false
    end
  end

  def self.build_random_combinations
    all.to_a.combination(2).to_a.shuffle!
  end
end
