class CreateGarrisonToken < ActiveRecord::Migration[5.1]
  def change
    create_table :garrison_tokens do |t|
      t.string :name, null: false
      t.string :territory, null: false

      t.integer :x
      t.integer :y

      t.belongs_to :game
      t.belongs_to :house
    end
  end
end
