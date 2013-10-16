class CreateManifests < ActiveRecord::Migration
  def change
    create_table :manifests do |t|
      t.string :title
      t.text   :description
      t.timestamps
    end
  end
end
