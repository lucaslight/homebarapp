class AddImageAndTags < ActiveRecord::Migration[7.0]
  def change
    add_column :cocktails, :image, :string
    add_column :cocktails, :IBA, :string
    add_column :cocktails, :tags, :string
    add_column :cocktails, :glass, :string
  end
end
