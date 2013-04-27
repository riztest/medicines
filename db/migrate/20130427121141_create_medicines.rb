class CreateMedicines < ActiveRecord::Migration
  def change
    create_table :medicines do |t|
      t.string :name
      t.text :code_for_placing_order
      t.integer :ordered_qty
      t.timestamps
    end
  end
end
