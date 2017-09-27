class GameSerializer < ActiveModel::Serializer
  attributes :id, :round, :wildling_threat

  has_many :houses
  has_many :tokens
  has_many :territories
end
