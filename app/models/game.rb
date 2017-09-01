class Game < ApplicationRecord
  # @todo
  # Create Player resource
  has_many :players

  # @todo Spec
  def territories
    @territories ||= fetch_territories
  end

  private

  def fetch_territories
    map_file_path = 'app/game_data/map_areas.yml'
    map_file = YAML.load_file(File.join(Rails.root, map_file_path))
    map_file.with_indifferent_access['map_areas'].map do |territory_data|
      Territory.new(self).tap do |territory|
        territory.assign_attributes(
          id: territory_data[:id],
          slug: territory_data[:slug],
          boundaries: territory_data[:boundaries]
        )
      end
    end
  end
end
