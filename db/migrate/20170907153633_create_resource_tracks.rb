class CreateResourceTracks < ActiveRecord::Migration[5.1]
  def up
    create_table :supply_tracks do |t|
      t.belongs_to :game

      t.json :positions, null: false, default: {
        "0" => [],
        "1" => ["stark"],
        "2" => ["baratheon", "lannister", "greyjoy", "tyrell", "martell"],
        "3" => [],
        "4" => [],
        "5" => [],
        "6" => []
      }
    end

    create_table :victory_tracks do |t|
      t.belongs_to :game

      t.json :positions, null: false, default: {
        "0" => [],
        "1" => ["baratheon", "lannister", "greyjoy", "tyrell", "martell"],
        "2" => ["stark"],
        "3" => [],
        "4" => [],
        "5" => [],
        "6" => []
      }
    end

    change_table :houses do |t|
      t.belongs_to :supply_track
      t.belongs_to :victory_track
    end

    change_table :games do |t|
      t.remove :victory_track
      t.remove :supply_track
    end
  end

  def down
    change_table :games do |t|
      t.json :victory_track, null: false, default: {
        "0" => [],
        "1" => ["baratheon", "lannister", "greyjoy", "tyrell", "martell"],
        "2" => ["stark"],
        "3" => [],
        "4" => [],
        "5" => [],
        "6" => []
      }
      t.json :supply_track, null: false, default: {
        "0" => [],
        "1" => ["stark"],
        "2" => ["baratheon", "lannister", "greyjoy", "tyrell", "martell"],
        "3" => [],
        "4" => [],
        "5" => [],
        "6" => []
      }
    end

    change_table :houses do |t|
      t.remove :victory_track_id
      t.remove :supply_track_id
    end

    drop_table :victory_tracks
    drop_table :supply_tracks
  end
end
