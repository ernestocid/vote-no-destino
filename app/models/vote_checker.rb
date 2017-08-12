module VoteChecker
  def self.compute_for(survey)
    compute survey.questions
  end

  def self.compute_all_votes
    compute Question.answered
  end

  private

  def self.compute(questions)
    vote_counts = Hash.new(0)
    return vote_counts unless questions.answered.any?
    questions.each { |question| vote_counts[question.name] += 1 }
    vote_counts.sort_by { |k,v| v }.reverse.to_h
  end
end
