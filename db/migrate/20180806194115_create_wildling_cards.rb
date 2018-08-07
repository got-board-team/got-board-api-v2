class CreateWildlingCards < ActiveRecord::Migration[5.2]
  def up
    create_table :wildling_cards do |t|
      t.string :name, null: false
      t.string :status, null: false
      t.integer :position, null: false
      t.references :game
    end

    remove_column :games, :wildling_cards
  end

  def down
    add_column :games, :wildling_cards, :json, array: true, default: []

    drop_table :wildling_cards
  end
end
