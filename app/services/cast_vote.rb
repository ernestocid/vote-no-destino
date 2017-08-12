module CastVote
  def self.call(params={})
    question = Question.find params[:id]
    question.update(answer_id: params[:question][:answer_id])
    question.next_unanswered_question
  end
end
