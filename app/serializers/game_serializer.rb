class GameSerializer < ActiveModel::Serializer
  # @todo Add round, wildling threat
  attributes :id

  has_many :territories
  has_many :houses
end
