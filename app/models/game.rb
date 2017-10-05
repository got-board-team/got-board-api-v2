class Game < ApplicationRecord
  has_many :houses

  has_many :tokens
  has_many :fiefdom_tokens
  has_many :kings_court_tokens
  has_many :iron_throne_tokens
  has_many :supply_tokens
  has_many :victory_tokens

  has_many :orders
  has_many :march_orders
  has_many :support_orders
  has_many :raid_orders
  has_many :defense_orders
  has_many :consolidation_orders

  has_many :units
  has_many :footmen
  has_many :knights
  has_many :ships
  has_many :siege_engines

  validates_numericality_of :round, greater_than: 0, less_than: 11
  validates_numericality_of :wildling_threat, greater_than: 0, less_than: 13, even: true

  def territories
    @territories ||= Games::FetchTerritories.run(game: self).result
  end
end
