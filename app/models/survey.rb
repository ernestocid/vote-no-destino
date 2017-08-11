class Survey < ApplicationRecord
  belongs_to :user, optional: true
  has_many :questions

  def unanswered_questions
    questions.where(answer: nil)
  end

  def next_unanswered_question
    unanswered_questions.first
  end
end
