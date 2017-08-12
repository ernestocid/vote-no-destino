require 'rails_helper'

feature 'User visits home' do
  before do
    create_sample_answered_survey
    visit root_path
  end

  scenario 'successfully' do
    expect(page).to display_button 'Start New Survey!'
    expect(page).to display_overall_results
  end
end
