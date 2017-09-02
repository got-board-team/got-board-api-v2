class CreateTracks < ActiveRecord::Migration[5.1]
  def change
    create_table :throne_tracks do |t|
      t.text :positions, default: ["baratheon", "lannister", "stark", "martell", "greyjoy", "tyrell"], null: false, array: true
      t.belongs_to :game
    end

    create_table :blade_tracks do |t|
      t.text :positions, default: ["greyjoy", "tyrell", "martell", "stark", "baratheon", "lannister"], null: false, array: true
      t.belongs_to :game
    end

    create_table :raven_tracks do |t|
      t.text :positions, default: ["lannister", "stark", "martell", "baratheon", "tyrell", "greyjoy"], null: false, array: true
      t.belongs_to :game
    end
  end
end
