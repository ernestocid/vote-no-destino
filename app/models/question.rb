class Question < ApplicationRecord
  belongs_to :survey
  belongs_to :answer, class_name: 'Option', optional: true
  has_many :question_options, dependent: :destroy
  has_many :options, through: :question_options

  scope :answered, -> { where.not(answer: nil) }

  delegate :name, to: :answer

  def answered?
    answer.present?
  end
end
