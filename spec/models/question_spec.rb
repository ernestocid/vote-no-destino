require 'rails_helper'

describe Question, type: :model do
  before(:each) do
    @answered_question = Question.new(answer: FactoryGirl.build(:option))
    @unanswered_question = Question.new
  end

  describe '#answered?' do
    it 'returns returns true if question has answer' do
      expect(@answered_question.answered?).to be_truthy
    end

    it 'returns returns false if question has no answer' do
      expect(@unanswered_question.answered?).to be_falsy
    end
  end
end
