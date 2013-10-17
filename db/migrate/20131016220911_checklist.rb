class Checklist < ActiveRecord::Migration
  def change
    create_table :checklists do |t|
      t.text :first
      t.text :second
      t.text :third
      t.text :fourth
      t.text :fifth
      t.text :sixth
      t.text :seventh
      t.text :eighth
      t.text :nineth
      t.text :tenth

      t.timestamps
    end
  end
end
