class CreateFixedcosts < ActiveRecord::Migration[6.0]
  def change
    create_table :fixedcosts do |t|
      t.integer :fixedcost_category_id, null: false
      t.integer :value, null: false
      t.string :description
      t.date :year_month, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
