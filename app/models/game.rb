class Game < ApplicationRecord
  has_many :houses
  has_many :tokens
  has_many :fiefdom_tokens
  has_many :kings_court_tokens
  has_many :iron_throne_tokens
  has_many :supply_tokens
  has_many :victory_tokens

  validates_numericality_of :round, greater_than: 0, less_than: 11
  validates_numericality_of :wildling_threat, greater_than: 0, less_than: 13, even: true

  def territories
    @territories ||= Games::FetchTerritories.run(game: self).result
  end
end
