class MakeReferencesInProjects < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key :projects, :partners
    add_foreign_key :projects, :locations
  end
end
