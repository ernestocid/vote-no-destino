require 'rails_helper'

describe VoteChecker, type: :model do
  before(:each) do
    @sample_survey = create_sample_answered_survey
  end

  describe '.compute_all_votes' do
    it 'returns return the results considering all answered questions' do
      results = VoteChecker.compute_all_votes

      expect(results.any?).to be_truthy
      expect(results.values).to match_array(results.values.sort.reverse)
    end

    it 'return empty hash if there are no questions answered' do
      Survey.destroy_all
      results = VoteChecker.compute_all_votes

      expect(results.empty?).to be_truthy
    end
  end

  describe '.compute_for' do
    it 'returns return the results for the given list of questions' do
      results = VoteChecker.compute_for(@sample_survey)

      expect(results.any?).to be_truthy
      expect(results.values).to match_array(results.values.sort.reverse)
    end

    it 'returns empty hash for an unanswered survey' do
      survey = create_sample_unanswered_survey
      results = VoteChecker.compute_for(survey)

      expect(results.empty?).to be_truthy
    end
  end
end
