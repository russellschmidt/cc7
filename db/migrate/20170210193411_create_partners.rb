class CreatePartners < ActiveRecord::Migration[5.0]
  def change
    create_table :partners do |t|
      t.string :name
      t.string :slug
      t.string :logo_aws_url

      t.timestamps
    end
  end
end
