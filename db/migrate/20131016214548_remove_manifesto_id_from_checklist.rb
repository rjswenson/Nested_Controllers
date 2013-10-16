class RemoveManifestoIdFromChecklist < ActiveRecord::Migration
  def change
    remove_column :checklists, :manifesto_id, :integer
  end
end
