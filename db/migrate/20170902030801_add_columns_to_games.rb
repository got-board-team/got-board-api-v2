class AddColumnsToGames < ActiveRecord::Migration[5.1]
  def change
    change_table :games do |t|
      t.integer :round, default: 1, null: false
      t.integer :wildling_threat, default: 2, null: false
    end
  end
end
