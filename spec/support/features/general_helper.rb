module Features
  def display_alert(text)
    have_selector '.alert', text: text
  end
end
