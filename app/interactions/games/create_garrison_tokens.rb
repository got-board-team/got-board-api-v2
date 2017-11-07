module Games
  class CreateGarrisonTokens < ActiveInteraction::Base
    object :game

    def execute
      garrison_setup.map do |house_name, garrison|
        house = game.houses.find_by(name: house_name)
        game.garrison_tokens.create(house: house,
                                    name: garrison,
                                    territory: garrison)
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
