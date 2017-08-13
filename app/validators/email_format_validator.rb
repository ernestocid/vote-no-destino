class EmailFormatValidator < ActiveModel::Validator
  EMAIL_REGEX = /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/

  def validate(record)
    return if record.email =~ EMAIL_REGEX
    record.errors[:email] << 'invalid email format'
  end
end
