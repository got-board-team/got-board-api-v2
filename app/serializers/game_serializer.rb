class GameSerializer < ActiveModel::Serializer
  attributes :id, :round, :wildling_threat

  has_many :houses

  has_many :iron_throne_tokens
  has_many :fiefdom_tokens
  has_many :kings_court_tokens
  has_many :supply_tokens
  has_many :victory_tokens
  has_many :territories

  has_many :march_orders
  has_many :support_orders
  has_many :raid_orders
  has_many :defense_orders
  has_many :consolidation_orders

  has_many :footmen
  has_many :knights
  has_many :ships
  has_many :siege_engines

  has_many :power_tokens
end
