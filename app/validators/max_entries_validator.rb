class MaxEntriesValidator < ActiveModel::Validator
  def validate(record)
    if record.class.count >= 5
      record.errors.add(:max_entries, 'only five entries allowed')
    end
  end
end
