class CreateSavings < ActiveRecord::Migration[6.0]
  def change
    create_table :savings do |t|
      t.integer :saving, null: false
      t.date :day, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
