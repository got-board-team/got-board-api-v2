class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.integer :x, default: 0, null: false
      t.integer :y, default: 0, null: false
      t.integer :strength

      t.string :territory
      t.string :type

      t.boolean :special, null: false
      t.boolean :revealed

      t.references :game
      t.references :house
    end
  end
end
