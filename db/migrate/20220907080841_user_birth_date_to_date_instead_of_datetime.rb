class UserBirthDateToDateInsteadOfDatetime < ActiveRecord::Migration[7.0]
  def change
    remove_columns(:users, :birth_date)
    add_column(:users, :birth_date, :date)
  end
end
