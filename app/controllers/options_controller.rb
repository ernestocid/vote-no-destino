class OptionsController < ApplicationController
  def index
    @options = Option.all
  end

  def new
    @option = Option.new
  end

  def create
    @option = Option.new(option_params)

    respond_to do |format|
      if @option.save
        format.html { redirect_to options_path, notice: t('messages.action_success') }
      else
        format.html { redirect_to options_path, alert: t('messages.action_failed') }
      end
    end
  end

  def destroy
    @option = Option.find params[:id]

    respond_to do |format|
      if @option.delete
        format.html { redirect_to options_path, notice: t('messages.action_success') }
      else
        format.html { redirect_to options_path, alert: t('messages.action_failed') }
      end
    end
  end

  private

  def option_params
    params.require(:option).permit(:name)
  end
end
