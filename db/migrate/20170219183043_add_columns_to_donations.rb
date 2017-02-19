class AddColumnsToDonations < ActiveRecord::Migration[5.0]
  def change
    add_reference :donations, :donor, foreign_key: true
    add_reference :donations, :campaign, foreign_key: true
    add_column :donations, :amount_in_cents, :integer
  end
end
