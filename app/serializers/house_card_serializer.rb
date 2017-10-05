class HouseCardSerializer < ActiveModel::Serializer
  attributes :name, :house_name

  def house_name
    object.house.name
  end
end
