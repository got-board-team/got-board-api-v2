module Games
  class FetchTerritories < ActiveInteraction::Base
    object :game

    def execute
      territory_file.with_indifferent_access["map_areas"].map do |territory_attrs|
        Game::Territory.new(game).tap do |territory|
          territory_attrs.keys.map do |attr|
            territory.assign_attributes(attr.to_sym => territory_attrs[attr])
          end
        end
      end
    end

    private

    def territory_file
      YAML.load_file(File.join(Rails.root, territory_file_path))
    end

    def territory_file_path
      "app/game_data/map_areas.yml"
    end
  end
end
