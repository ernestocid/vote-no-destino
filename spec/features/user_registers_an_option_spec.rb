require 'rails_helper'

feature 'User registers an option' do
  before do
    visit options_path
  end

  scenario 'successfully' do
    create_option(name: 'Rio de Janeiro')
    expect(page).to display_option 'Rio de Janeiro'
  end
end
