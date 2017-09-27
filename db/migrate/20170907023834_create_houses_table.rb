class CreateHousesTable < ActiveRecord::Migration[5.1]
  def change
    create_table :houses do |t|
      t.string :name, null: false
      t.belongs_to :game
      
      t.index [:name, :game_id]
    end
  end
end
