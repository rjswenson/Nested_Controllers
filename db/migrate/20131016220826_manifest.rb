class Manifest < ActiveRecord::Migration
  def change
    create_table :manifests do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
