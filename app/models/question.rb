class Question < ApplicationRecord
  default_scope { includes(:answer) }

  belongs_to :survey
  belongs_to :answer, class_name: 'Option', optional: true
  has_many :question_options, dependent: :destroy
  has_many :options, through: :question_options

  scope :answered, -> { where.not(answer: nil) }

  delegate :name, to: :answer
  delegate :next_unanswered_question, to: :survey

  def answered?
    answer.present?
  end

  def questions_left
    survey.unanswered_questions.count
  end
end
