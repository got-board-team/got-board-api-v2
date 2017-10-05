class CreateHouseCards < ActiveRecord::Migration[5.1]
  def change
    create_table :house_cards do |t|
      t.string :name

      t.references :game
      t.references :house
    end
  end
end
