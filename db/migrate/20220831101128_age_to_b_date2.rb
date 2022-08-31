class AgeToBDate2 < ActiveRecord::Migration[7.0]
  def change
    remove_columns(:users, :age)
    add_column(:users, :birth_date, :datetime)
  end
end
