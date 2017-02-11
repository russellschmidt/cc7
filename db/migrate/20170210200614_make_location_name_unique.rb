rake class MakeLocationNameUnique < ActiveRecord::Migration[5.0]
  def change
    change_column :locations, :name, :string, :null => false, :unique => true
  end
end
