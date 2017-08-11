FactoryGirl.define do
  factory :survey do
    factory :survey_with_questions do
      transient do
        questions_count 3
      end
    end
  end
end
