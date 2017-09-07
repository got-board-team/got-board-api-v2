module ResourceTrackable
  extend ActiveSupport::Concern

  included do
    include Trackable

    private

    def house_uniqueness_in_track
      positions.map do |_position, houses|
        next if houses.uniq == houses
        errors.add(:positions, "house cannot be repeated in track")
      end
    end

    def invalid_houses_presence_in_track
      positions.map do |_position, houses|
        houses.map do |house|
          next if House::VALID_HOUSES.include?(house)
          errors.add(:positions, "#{house} house is not a valid house")
        end
      end
    end
  end
end
