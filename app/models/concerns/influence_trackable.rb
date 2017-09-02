module InfluenceTrackable
  extend ActiveSupport::Concern

  included do
    belongs_to :game

    validate :house_uniqueness_in_track
    validate :valid_houses_presence_in_track
    validate :invalid_houses_presence_in_track

    private

    def house_uniqueness_in_track
      return if positions.uniq == positions
      errors.add(:positions, "house cannot be repeated in track")
    end

    def valid_houses_presence_in_track
      Game::VALID_HOUSES.map do |house|
        next if positions.include?(house)
        errors.add(:positions, "#{house} house is not in the track")
      end
    end

    def invalid_houses_presence_in_track
      positions.map do |house|
        next if Game::VALID_HOUSES.include?(house)
        errors.add(:positions, "#{house} house is not a valid house")
      end
    end
  end
end
