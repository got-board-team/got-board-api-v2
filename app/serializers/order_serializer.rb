class OrderSerializer
  include FastJsonapi::ObjectSerializer

  set_key_transform :dash
  attributes :x, :y, :territory, :revealed, :special, :strength

  belongs_to :game
  belongs_to :house

  attribute :order_type, &:type
  attribute :house_name do |object|
    object.house.name
  end
end
