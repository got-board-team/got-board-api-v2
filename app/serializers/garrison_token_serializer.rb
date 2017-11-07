class GarrisonTokenSerializer < ActiveModel::Serializer
  attributes :name, :territory, :house_name, :x, :y

  def house_name
    object.house.name
  end
end
