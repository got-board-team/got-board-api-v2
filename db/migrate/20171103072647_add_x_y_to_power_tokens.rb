class AddXYToPowerTokens < ActiveRecord::Migration[5.1]
  def change
    add_column :power_tokens, :x, :integer, null: false, default: 0
    add_column :power_tokens, :y, :integer, null: false, default: 0
  end
end
