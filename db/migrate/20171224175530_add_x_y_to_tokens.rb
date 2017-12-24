class AddXYToTokens < ActiveRecord::Migration[5.1]
  def change
    add_column :tokens, :x, :integer, default: 0, null: false
    add_column :tokens, :y, :integer, default: 0, null: false
  end
end
