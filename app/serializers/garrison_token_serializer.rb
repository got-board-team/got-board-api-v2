class GarrisonTokenSerializer
  include FastJsonapi::ObjectSerializer

  set_key_transform :dash
  attributes :name, :territory, :x, :y

  attribute :house_name do |object|
    object.house.name
  end
end
