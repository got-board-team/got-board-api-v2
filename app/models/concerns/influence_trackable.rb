module InfluenceTrackable
  extend ActiveSupport::Concern

  included do
    belongs_to :game

    # @todo spec
    has_many :houses

    validate :house_uniqueness_in_track
    validate :invalid_houses_presence_in_track

    private

    def house_uniqueness_in_track
      return if positions.uniq == positions
      errors.add(:positions, "house cannot be repeated in track")
    end

    def invalid_houses_presence_in_track
      positions.map do |house|
        next if House::VALID_HOUSES.include?(house)
        errors.add(:positions, "#{house} house is not a valid house")
      end
    end
  end
end
