class CreateNeutralForceTokens < ActiveRecord::Migration[5.1]
  def change
    create_table :neutral_force_tokens do |t|
      t.string :territory, null: :false

      t.references :game
    end
  end
end
