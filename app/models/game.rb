class Game < ApplicationRecord
  has_one :blade_track
  has_one :raven_track
  has_one :throne_track

  has_many :houses

  validates_numericality_of :round, greater_than: 0, less_than: 11
  validates_numericality_of :wildling_threat, greater_than: 0, less_than: 13, even: true

  def territories
    @territories ||= Games::FetchTerritories.run(game: self).result
  end
end
