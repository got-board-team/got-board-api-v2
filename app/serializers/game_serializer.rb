class GameSerializer < ActiveModel::Serializer
  # @todo Add round, wildling threat
  attributes :id

  has_many :territories
  has_many :houses

  has_one :blade_track
  has_one :raven_track
  has_one :throne_track
  has_one :supply_track
  has_one :victory_track
end
