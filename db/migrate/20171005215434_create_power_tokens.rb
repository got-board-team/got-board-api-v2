class CreatePowerTokens < ActiveRecord::Migration[5.1]
  def change
    create_table :power_tokens do |t|
      t.string :territory

      t.boolean :available, default: false, null: false

      t.references :house
      t.references :game
    end
  end
end
