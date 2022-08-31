class AgeToBDate < ActiveRecord::Migration[7.0]
  def rename_column(users, age, birth_date)
    raise NotImplementedError, "rename_column is not implemented"
  end
end
