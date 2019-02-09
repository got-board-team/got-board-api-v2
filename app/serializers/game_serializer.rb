class GameSerializer
  include FastJsonapi::ObjectSerializer

  set_key_transform :dash
  attributes :round, :wildling_threat

  has_many :houses
  has_many :units
  has_many :orders
  has_many :power_tokens
  has_many :house_cards
  has_many :wildling_cards

  has_many :neutral_force_tokens
  has_many :garrison_tokens

  has_many :fiefdom_tokens
  has_many :kings_court_tokens
  has_many :iron_throne_tokens
  has_many :supply_tokens
  has_many :victory_tokens

  has_many :territories
end
