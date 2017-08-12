require 'rails_helper'

feature 'User answers survey' do
  before do
    create_sample_options
    visit '/vote-no-destino'
  end

  scenario 'successfully' do
    10.times do
      choose 'question[answer_id]', :match => :first
      click_on 'Vote'
    end

    fill_in 'Name', with: 'John Snow'
    fill_in 'Email', with: 'thekinginthenorth@winterfell.com'
    click_on 'Finish Survey'

    expect(page).to display_notice 'Thanks for answering our survey!'
  end
end
