class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string  :name,                    null: false
      t.text    :message,                 null: false
      t.integer :category_id,             null: false
      t.integer :price,                   null: false
      t.integer :condition_id,            null: false
      t.integer :shipping_cost_burden_id, null: false
      t.integer :prefecture_id,           null: false
      t.integer :day_to_ship_id,          null: false
      t.references :user,                 null: false, foreign_key: true
      t.timestamps
    end
  end
end
