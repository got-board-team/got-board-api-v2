class TokenSerializer < ActiveModel::Serializer
  attributes :id, :type, :position, :x, :y, :house_name

  belongs_to :game
  belongs_to :house

  def house_name
    object.house.name
  end
end
