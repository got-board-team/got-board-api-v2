class UnitSerializer
  include FastJsonapi::ObjectSerializer

  set_key_transform :dash
  attributes :territory, :x, :y

  belongs_to :game

  attribute :unit_type, &:type
  attribute :house_name do |object|
    object.house.name
  end
end
