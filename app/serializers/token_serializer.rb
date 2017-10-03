# @todo spec
class TokenSerializer < ActiveModel::Serializer
  attributes :id, :type, :position, :house_name

  belongs_to :game

  def house_name
    object.house.name
  end
end
