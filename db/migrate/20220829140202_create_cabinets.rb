class CreateCabinets < ActiveRecord::Migration[7.0]
  def change
    create_table :cabinets do |t|
      t.references :user, null: false, foreign_key: true
      t.references :ingredient, null: false, foreign_key: true
      t.boolean :in_stock, default: true

      t.timestamps
    end
  end
end
