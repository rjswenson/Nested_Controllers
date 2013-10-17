class RemoveEverythingFromChecklist < ActiveRecord::Migration
  def change
    change_table :checklists do |t|
      t.remove :first, :second, :third, :fourth, :fifth
      t.remove :sixth, :seventh, :eighth, :nineth, :tenth
      t.text :step
    end
  end
end
