class CreateTerritories < ActiveRecord::Migration[5.2]
  def change
    create_table :territories do |t|
      t.string :territory_type
      t.string :fortification_type

      t.text :boundaries

      t.string :supply_icons
      t.string :power_icons
      t.string :house_sigil

      t.string :slug
      t.json :names
    end
  end
end
