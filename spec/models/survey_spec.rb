require 'rails_helper'

describe Survey, type: :model do
  before(:each) do
    create_sample_options
    @survey = CreateSurvey.call
  end

  describe '#unanswered_questions' do
    it 'returns unanswered questions' do
      expect(@survey.unanswered_questions.size).to be_equal 10
    end
  end

  describe '#next_unanswered_question' do
    it 'returns a questions if there are unanswered questions' do
      expect(@survey.next_unanswered_question).not_to be_nil
    end

    it 'returns nil if all questions are answered' do
      # Answering all questions
      @survey.questions.each do |question|
        question.answer = question.options.first
      end

      expect(@survey.next_unanswered_question).not_to be_nil
    end
  end
end
