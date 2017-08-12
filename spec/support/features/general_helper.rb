module Features
  def display_alert(text)
    have_selector '.alert', text: text
  end

  def display_notice(text)
    have_selector '.notice', text: text
  end
end
