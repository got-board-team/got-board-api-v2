# @todo spec
module Games
  class CreateHouseCards < ActiveInteraction::Base
    object :game

    def execute
      game.houses.map do |house|
        cards_setup[house.name].map do |card|
          house.house_cards.create(game: game, name: card)
        end
      end
    end

    private

    def cards_setup
      @cards_setup ||= begin
                         file_path = "app/game_data/house_cards.yml"
                         YAML.load_file(File.join(Rails.root, file_path))
                       end
    end
  end
end
