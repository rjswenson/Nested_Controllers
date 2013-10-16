class AddTitleAndBodyToManifest < ActiveRecord::Migration
  def change
    add_column :manifests, :title, :string
    add_column :manifests, :body, :text
  end
end
