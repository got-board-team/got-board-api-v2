class CreateWesterosDecks < ActiveRecord::Migration[5.2]
  def change
    create_table :westeros_decks do |t|
      t.bigint :tier, null: false, index: true

      t.bigint :game_id, null: false, index: true

      t.timestamps
    end

    create_table :westeros_cards do |t|
      t.string :title, null: false
      t.string :revealed, default: false, null: false

      t.integer :position, null: false

      t.bigint :westeros_deck_id, null: false, index: true

      t.timestamps
    end
  end
end
