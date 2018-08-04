module Games
  class CreateHouseCards < ActiveInteraction::Base
    object :game

    def execute
      HouseCard.import(house_cards_attributes, validate: false)
    end

    private

    def house_cards_attributes
      game.houses.map do |house|
        cards_setup[house.name].map do |name|
          { name: name, game_id: game.id, house_id: house.id }
        end
      end.flatten
    end

    def cards_setup
      @cards_setup ||= begin
                         file_path = "app/game_data/house_cards.yml"
                         YAML.load_file(File.join(Rails.root, file_path))
                       end
    end
  end
end
