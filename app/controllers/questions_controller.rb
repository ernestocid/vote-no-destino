class QuestionsController < ApplicationController
  def edit
    @question = Question.find params[:id]
  end

  def update
    question = Question.find params[:id]
    question.update(question_params)

    next_question = question.survey.next_unanswered_question

    respond_to do |format|
      if next_question.present?
        format.html { redirect_to edit_survey_question_path(question.survey, next_question) }
      else
        format.html { redirect_to edit_survey_path(question.survey) }
      end
    end
  end

  private

  def question_params
    params.require(:question).permit(:answer_id)
  end
end
