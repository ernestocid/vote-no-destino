module Features
  def cast_all_votes
    10.times do
      choose_first_option
      click_on 'Vote'
    end
  end

  def choose_first_option
    choose 'question[answer_id]', :match => :first
  end

  def fill_user_information(name:, email:)
    fill_in 'Name', with: name
    fill_in 'Email', with: email
  end

  def display_alert(text)
    have_selector '.alert', text: text
  end

  def display_notice(text)
    have_selector '.notice', text: text
  end

  def display_user_results
    have_selector '#user_results'
  end

  def display_overall_results
    have_selector '#overall_results'
  end

  def display_button(text)
    have_selector '.btn', text: text
  end
end
