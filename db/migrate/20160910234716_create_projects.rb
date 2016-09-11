class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.integer :product_id
      t.string :project_name
      t.string :client_name
      t.string :user_email
      t.timestamp :creation_date
      t.datetime :due_date
      t.text :problem
      t.text :objective
      t.text :target_market
      t.text :business_description
      t.text :project_description
      t.text :expected_results
      t.text :important_notes

      t.timestamps null: false
    end
  end
end
