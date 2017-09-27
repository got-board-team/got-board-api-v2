class CreateTokens < ActiveRecord::Migration[5.1]
  def change
    create_table :tokens do |t|
      t.integer :position, null: false
      t.string :type
      t.references :house
      t.references :game
      t.timestamps
    end
  end
end
