class AddPlayerRangeAndStrengthToNeutralForceTokens < ActiveRecord::Migration[5.1]
  def up
    add_column :neutral_force_tokens, :player_range, :string
    add_column :neutral_force_tokens, :strength, :integer, null: false, default: 0
    add_column :neutral_force_tokens, :x, :integer, null: false, default: 0
    add_column :neutral_force_tokens, :y, :integer, null: false, default: 0
    add_column :neutral_force_tokens, :defeated, :boolean, null: false, default: false
  end

  def down
    remove_column :neutral_force_tokens, :player_range
    remove_column :neutral_force_tokens, :strength
    remove_column :neutral_force_tokens, :x
    remove_column :neutral_force_tokens, :y
    remove_column :neutral_force_tokens, :defeated
  end
end
