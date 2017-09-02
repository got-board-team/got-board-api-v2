class AddColumnsToGames < ActiveRecord::Migration[5.1]
  def change
    change_table :games do |t|
      t.integer :round, default: 1, null: false
      t.integer :wildling_threat, default: 2, null: false
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
  end
end
