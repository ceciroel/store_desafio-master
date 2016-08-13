class AddAgeToUser < ActiveRecord::Migration
  def change
    add_column :users, :age, :integer
  end
  def down
  	remove_column :users, :age, :integer
  end
end
