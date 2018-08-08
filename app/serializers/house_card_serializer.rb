class HouseCardSerializer
  include FastJsonapi::ObjectSerializer

  set_key_transform :dash
  attributes :name, :house_name

  def house_name
    object.house.name
  end
end
