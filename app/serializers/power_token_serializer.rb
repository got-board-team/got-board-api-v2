class PowerTokenSerializer < ActiveModel::Serializer
  attributes :available, :territory, :house_name

  def house_name
    object.house.name
  end
end
