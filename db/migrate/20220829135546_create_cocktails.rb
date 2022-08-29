class CreateCocktails < ActiveRecord::Migration[7.0]
  def change
    create_table :cocktails do |t|
      t.string :name
      t.string :instructions
      t.boolean :alcoholic

      t.timestamps
    end
  end
end
