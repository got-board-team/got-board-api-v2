class UnitSerializer < ActiveModel::Serializer
  attributes :id, :type, :house_name, :territory, :x, :y

  belongs_to :game

  def house_name
    object.house.name
  end
end
