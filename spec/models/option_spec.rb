require 'rails_helper'

describe Option, type: :model do
  before(:each) do
    create_sample_options
    @sample_option = Option.last
  end

  describe '#name' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name) }
  end

  describe '#delete' do
    it 'deletes and returns true if it can be destroyed' do
      expect(@sample_option.delete).to be_truthy
    end

    it 'returns false if it can not be destroyed' do
      sample_survey = Survey.create
      sample_question = Question.create(survey: sample_survey)
      sample_question.options << @sample_option
      sample_question.save

      expect(@sample_option.delete).to be_falsy
    end
  end

  describe '.build_random_combinations' do
    it 'returns an array with random option combinations' do
      combinations = Option.build_random_combinations

      expect(combinations.class).to be_equal Array
      expect(combinations.size).to be_equal 10
    end
  end
end
