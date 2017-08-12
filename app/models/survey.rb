class Survey < ApplicationRecord
  belongs_to :user, optional: true
  has_many :questions, dependent: :destroy

  accepts_nested_attributes_for :user

  def unanswered_questions
    questions.where(answer: nil)
  end

  def next_unanswered_question
    unanswered_questions.first || NilQuestion.new
  end
end
