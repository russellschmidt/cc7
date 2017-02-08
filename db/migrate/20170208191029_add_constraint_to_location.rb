class AddConstraintToLocation < ActiveRecord::Migration[5.0]
  def change
    change_column :locations, :name, :string, :null => false
    change_column :locations, :slug, :string, :null => false
  end
end
