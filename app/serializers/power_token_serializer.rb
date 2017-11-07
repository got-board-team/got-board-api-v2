class PowerTokenSerializer < ActiveModel::Serializer
  attributes :available, :territory, :house_name, :x, :y

  def house_name
    object.house.name
  end
end
