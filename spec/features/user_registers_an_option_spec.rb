require 'rails_helper'

feature 'User registers an option' do
  before do
    visit options_path
  end

  scenario 'successfully' do
    create_option(name: 'Rio de Janeiro')
    expect(page).to display_option 'Rio de Janeiro'
  end

  scenario 'registers more actions then allowed' do
    create_option(name: 'Rio de Janeiro')
    create_option(name: 'Fortaleza')
    create_option(name: 'Natal')
    create_option(name: 'São Paulo')
    create_option(name: 'Curitiba')
    create_option(name: 'Porto Alegre')

    expect(page).to display_alert I18n.t('messages.action_failed')
  end
end
