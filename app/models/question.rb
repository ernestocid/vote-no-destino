class Question < ApplicationRecord
  belongs_to :survey
  belongs_to :answer, class_name: 'Option'
  has_many :question_options
  has_many :options, through: :question_options
end
