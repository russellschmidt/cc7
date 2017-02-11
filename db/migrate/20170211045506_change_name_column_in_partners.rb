class ChangeNameColumnInPartners < ActiveRecord::Migration[5.0]
  def change
    change_column :partners, :name, :string, :null => false, :unique => true
  end
end
