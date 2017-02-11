class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :name, :unique => true, :null => false
      t.string :slug, :unique => true, :null => false
      t.integer :partner_id, :index => true
      t.integer :location_id, :index => true
      t.text :blurb
      t.text :description

      t.timestamps
    end
  end
end
