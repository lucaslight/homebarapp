class ChangeAgeToDate < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :age
    add_column :users, :age, :date
  end
end
