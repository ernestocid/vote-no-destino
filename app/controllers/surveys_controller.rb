class SurveysController < ApplicationController
  def create
    survey = CreateSurvey.call

    respond_to do |format|
      format.html { redirect_to edit_survey_question_path(survey, survey.next_unanswered_question) }
    end
  end

  def edit
    @survey = Survey.find params[:id]
    @survey.build_user
  end

  def update
    @survey = Survey.find params[:id]

    respond_to do |format|
      if @survey.update(survey_params)
        format.html { redirect_to survey_path(@survey), notice: 'Thanks for answering our survey!' }
      else
        format.html { redirect_to edit_survey_path(@survey), alert: @survey.errors.full_messages.join(', ') }
      end
    end
  end

  def show
    survey = Survey.find params[:id]
    @user_results = VoteChecker.compute_for survey
    @overall_results = VoteChecker.compute_all_votes
  end

  private

  def survey_params
    params.require(:survey).permit(user_attributes: [:name, :email])
  end
end
