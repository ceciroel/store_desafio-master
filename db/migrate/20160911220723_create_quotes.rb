class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.integer :product_id
      t.string :project_name
      t.string :client_name
      t.string :user_email
      t.timestamp :creation_date
      t.string :item
      t.text :item_description
      t.float :unit_price
      t.integer :quantity
      t.float :price
      t.float :total_price

      t.timestamps null: false
    end
  end
end
