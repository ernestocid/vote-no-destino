class QuestionsController < ApplicationController
  def edit
    @question = Question.find params[:id]
  end

  def update
    next_question = CastVote.call(params)

    respond_to do |format|
      if !next_question.answered?
        format.html { redirect_to edit_survey_question_path(params[:survey_id], next_question) }
      else
        format.html { redirect_to edit_survey_path(params[:survey_id]) }
      end
    end
  end

  private

  def question_params
    params.require(:question).permit(:answer_id)
  end
end
