class CreateInfluenceTokensTable < ActiveRecord::Migration[5.1]
  def change
    create_table :influence_tokens do |t|
      t.integer :position, null: false
      t.references :house
      t.references :game
      t.timestamps
    end
  end
end
