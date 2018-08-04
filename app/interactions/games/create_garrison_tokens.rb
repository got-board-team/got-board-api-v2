module Games
  class CreateGarrisonTokens < ActiveInteraction::Base
    object :game

    def execute
      garrison_setup.map do |house_name, attrs|
        house = game.houses.find_by(name: house_name)
        next if house.nil?
        create_garrison_token(house, attrs)
      end
    end

    private

    def garrison_setup
      file_path = "app/game_data/garrison_tokens.yml"
      YAML.load_file(
        Rails.root.join(file_path)
      )
    end

    def create_garrison_token(house, attributes)
      name = attributes["name"]

      game.garrison_tokens.create(
        house: house,
        name: name,
        territory: name,
        x: attributes["x"],
        y: attributes["y"]
      )
    end
  end
end
