# @todo spec
class OrderSerializer < ActiveModel::Serializer
  belongs_to :game
  belongs_to :house

  attributes(
    :type,
    :x,
    :y,
    :territory,
    :revealed,
    :special,
    :strength,
    :house_name
  )

  def house_name
    object.house.name
  end
end
