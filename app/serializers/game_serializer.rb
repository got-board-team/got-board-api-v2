class GameSerializer < ActiveModel::Serializer
  attributes :id, :round, :wildling_threat

  has_many :houses

  has_many :iron_throne_tokens
  has_many :fiefdom_tokens
  has_many :kings_court_tokens
  has_many :supply_tokens
  has_many :victory_tokens
  has_many :territories

  has_many :footmen
  has_many :knights
  has_many :ships
  has_many :siege_engines
end
