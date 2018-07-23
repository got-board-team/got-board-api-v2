class GameSerializer < ActiveModel::Serializer
  attributes :id, :round, :wildling_threat, :wildling_cards

  has_many :houses
  has_many :units
  has_many :orders
  has_many :power_tokens
  has_many :house_cards

  has_many :neutral_force_tokens
  has_many :garrison_tokens

  has_many :influence_tokens
  has_many :supply_tokens
  has_many :victory_tokens

  has_many :territories
end
