class CreateInfluenceTokensTable < ActiveRecord::Migration[5.1]
  def change
    create_table :influence_tokens do |t|
      t.integer :position, null: false
      t.references :influence_track, polymorphic: true, index: { name: "index_influence_tokens_on_track_id_and_type" }
      t.references :house
      t.references :game
      t.timestamps
    end
  end
end
