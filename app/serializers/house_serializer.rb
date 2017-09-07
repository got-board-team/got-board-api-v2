class HouseSerializer < ActiveModel::Serializer
  attributes :id,
             :name,
             :victory_position,
             :supply_position,
             :blade_position,
             :raven_position,
             :throne_position

  belongs_to :game
  belongs_to :blade_track
  belongs_to :raven_track
  belongs_to :throne_track
end
