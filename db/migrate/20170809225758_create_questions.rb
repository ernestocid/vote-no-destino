class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.references :answer, index: true, foreign_key: { to_table: :options }
    end
  end
end
