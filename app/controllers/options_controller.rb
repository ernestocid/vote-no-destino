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
        format.html { redirect_to options_path, notice: 'Saved successfully.' }
      else
        format.html { redirect_to options_path, alert: 'Could not save.' }
      end
    end
  end

  private

  def option_params
    params.require(:option).permit(:name)
  end
end
