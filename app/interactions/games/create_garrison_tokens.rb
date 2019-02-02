module Games
  class CreateGarrisonTokens < ActiveInteraction::Base
    object :game

    def execute
      @garrisons = []

      garrison_setup.map do |house_name, garrison_attributes|
        house = game.houses.find_by(name: house_name)
        next if house.nil?

        build_garrison_attributes(house.id, garrison_attributes)
      end

      GarrisonToken.import(@garrisons)
    end

    private

    def garrison_setup
      file_path = "app/game_data/garrison_tokens.yml"
      YAML.load_file(
        Rails.root.join(file_path)
      )
    end

    def build_garrison_attributes(house_id, attributes)
      name = attributes["name"]

      @garrisons << {
        house_id: house_id,
        game_id: game.id,
        name: name,
        territory: name,
        x: attributes["x"],
        y: attributes["y"]
      }
    end
  end
end
