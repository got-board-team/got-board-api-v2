module Games
  class CreateGarrisonTokens < ActiveInteraction::Base
    object :game

    def execute
      garrison_setup.map do |house_name, attrs|
        house = game.houses.find_by(name: house_name)
        game.garrison_tokens.create(house: house,
                                    name: attrs["name"],
                                    territory: attrs["name"],
                                    x: attrs["x"],
                                    y: attrs["y"])
      end
    end

    private

    def garrison_setup
      file_path = "app/game_data/garrison_tokens.yml"
      YAML.load_file(
        Rails.root.join(file_path)
      )
    end
  end
end
