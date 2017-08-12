module CreateSurvey
  def self.call
    survey = Survey.new

    combinations = Option.build_random_combinations
    combinations.each do |combination|
      survey.questions << Question.new(options: combination)
    end
    survey.save!

    survey
  end
end
