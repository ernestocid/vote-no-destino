class CreateOptionsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :options do |t|
      t.string :name
    end
  end
end
