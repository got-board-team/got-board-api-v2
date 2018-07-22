class CreateWildlingCards < ActiveRecord::Migration[5.1]
  def change
    create_table :wildling_cards do |t|
      t.references :game
    end
  end
end
