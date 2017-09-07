class CreateHousesTable < ActiveRecord::Migration[5.1]
  def change
    create_table :houses do |t|
      t.string :name, null: false
      t.integer :blade_position, null: false
      t.integer :raven_position, null: false
      t.integer :throne_position, null: false
      t.integer :supply_position, null: false
      t.integer :victory_position, null: false
      t.belongs_to :game
      t.belongs_to :blade_track
      t.belongs_to :raven_track
      t.belongs_to :throne_track

      t.index [:name, :game_id]
    end
  end
end
