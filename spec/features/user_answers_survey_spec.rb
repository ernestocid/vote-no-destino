require 'rails_helper'

feature 'User answers survey' do
  before do
    create_sample_options
    visit '/vote-no-destino'
  end

  scenario 'successfully' do
    cast_all_votes
    fill_user_information(name: 'Jon Snow', email: 'thekinginthenorth@winterfell.com')
    click_on 'Finish Survey'

    expect(page).to display_notice 'Thanks for answering our survey!'
  end
end
