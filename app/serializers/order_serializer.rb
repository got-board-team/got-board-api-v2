# @todo spec
class OrderSerializer < ActiveModel::Serializer
  attributes :id, :type, :x, :y, :territory, :revealed, :special, :strength
  belongs_to :game

  def house_name
    object.house.name
  end
end
