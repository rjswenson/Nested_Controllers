class CreateChecklists < ActiveRecord::Migration
  def change
    create_table :checklists do |t|
      t.text :steps
      t.timestamps
    end
  end
end
