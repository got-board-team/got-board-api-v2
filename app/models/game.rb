class Game < ApplicationRecord
  VALID_HOUSES = %w[baratheon lannister stark greyjoy tyrell martell].freeze

  # @todo
  # Create Player resource
  has_many :players

  # @todo
  # Create House model/class

  validates_numericality_of :round, greater_than: 0, less_than: 11
  validates_numericality_of :wildling_threat, greater_than: 0, less_than: 13, even: true

  validate :house_uniqueness_in_influence_tracks
  validate :valid_houses_in_influence_tracks

  def territories
    @territories ||= fetch_territories
  end

  private

  def house_uniqueness_in_influence_tracks
    %i[throne blade raven].map do |track|
      track_method = "#{track}_track"
      next if send(track_method).uniq == send(track_method)
      errors.add(track_method, "house cannot be repeated in #{track} track")
    end
  end

  # @todo spec
  def valid_houses_in_influence_tracks
    %i[throne blade raven].map do |track|
      track_method = "#{track}_track"
      send(track_method).map do |house|
        next if VALID_HOUSES.include?(house)
        errors.add(track_method, "#{house} is not a valid house")
      end
    end
  end

  def fetch_territories
    map_file_path = "app/game_data/map_areas.yml"
    map_file = YAML.load_file(File.join(Rails.root, map_file_path))
    map_file.with_indifferent_access["map_areas"].map do |territory_data|
      Territory.new(self).tap do |territory|
        territory_data.keys.map do |attr|
          territory.assign_attributes(attr.to_sym => territory_data[attr])
        end
      end
    end
  end
end
