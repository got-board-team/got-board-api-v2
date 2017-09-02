class GameSerializer < ActiveModel::Serializer
  attributes :id

  has_many :territories

  has_one :blade_track
  has_one :raven_track
  has_one :throne_track
end
