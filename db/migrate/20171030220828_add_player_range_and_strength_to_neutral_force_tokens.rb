class AddPlayerRangeAndStrengthToNeutralForceTokens < ActiveRecord::Migration[5.1]
  def change
    change_column :neutral_force_tokens, :territory, :string, null: true
    add_column :neutral_force_tokens, :player_range, :string
    add_column :neutral_force_tokens, :strength, :integer
  end
end
