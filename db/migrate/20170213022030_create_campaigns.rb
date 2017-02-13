class CreateCampaigns < ActiveRecord::Migration[5.0]
  def change
    create_table :campaigns do |t|
      t.references :project_id, foreign_key: true
      t.string :name
      t.text :description
      t.decimal :dollar_goal
      t.datetime :start_date
      t.datetime :end_date
      t.string :timezone
      t.boolean :active?
      t.string :slug

      t.timestamps
    end
    add_index :campaigns, :name, unique: true
    add_index :campaigns, :slug, unique: true
  end
end
