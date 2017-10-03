class CreateUnits < ActiveRecord::Migration[5.1]
  def change
    create_table :units do |t|
      t.integer :x, default: 0, null: false
      t.integer :y, default: 0, null: false
      t.boolean :routed, default: false, null: false
      t.string :territory
      t.string :type

      t.references :game
      t.references :house
    end
  end
end
