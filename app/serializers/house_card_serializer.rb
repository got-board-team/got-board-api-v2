class HouseCardSerializer
  include FastJsonapi::ObjectSerializer

  set_key_transform :dash
  attributes :name

  attribute :house_name do |object|
    object.house.name
  end
end
