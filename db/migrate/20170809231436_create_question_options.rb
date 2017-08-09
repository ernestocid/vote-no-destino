class CreateQuestionOptions < ActiveRecord::Migration[5.0]
  def change
    create_table :question_options do |t|
      t.references :question, foreign_key: true
      t.references :option, foreign_key: true
    end
  end
end
