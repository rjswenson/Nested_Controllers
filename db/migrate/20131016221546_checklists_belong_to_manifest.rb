class ChecklistsBelongToManifest < ActiveRecord::Migration
  def change
    change_table :checklists do |t|
      t.belongs_to :manifest
    end
  end
end
