class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :street1
      t.string :street2
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone
      t.string :email
      t.string :homepage
      t.references :addressable, polymorphic: true

      t.timestamps
    end
  end
end
