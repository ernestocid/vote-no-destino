require 'rails_helper'

describe CreateSurvey do
  before(:each) do
    create_sample_options
  end

  describe '.call' do
    it 'creates a new survey' do
      survey = CreateSurvey.call

      expect(survey.persisted?).to be_truthy
      expect(survey.user).to be_nil
      expect(survey.questions.size).to be_equal 10
    end
  end
end
