class ChangeSlugColumnInPartners < ActiveRecord::Migration[5.0]
  def change
    change_column :partners, :slug, :string, :unique => true
  end
end
