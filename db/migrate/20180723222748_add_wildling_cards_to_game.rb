class AddWildlingCardsToGame < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :wildling_cards, :json, array: true, default: []
  end
end
