class AddSlugToCamps < ActiveRecord::Migration
  def change
    add_column :camps, :slug, :string
    add_index :camps, :slug, unique: true
  end
end
