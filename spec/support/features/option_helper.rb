module Features
  def create_option(name:)
    click_on 'New Option'
    fill_in 'Name', with: name
    click_on 'Save'
  end

  def display_option(name)
    have_selector '.options', text: name
  end
end
