module SampleData
  def create_sample_options
    FactoryGirl.create(:option, name: 'Rio de Janeiro')
    FactoryGirl.create(:option, name: 'Fortaleza')
    FactoryGirl.create(:option, name: 'São Paulo')
    FactoryGirl.create(:option, name: 'Natal')
    FactoryGirl.create(:option, name: 'Porto Alegre')
  end

  def create_sample_answered_survey
    unless Option.any?
      create_sample_options
    end

    survey = CreateSurvey.call
    survey.questions.each do |question|
      question.answer = question.options.sample
      question.save
    end

    survey
  end

  def create_sample_unanswered_survey
    unless Option.any?
      create_sample_options
    end

    CreateSurvey.call
  end
end
