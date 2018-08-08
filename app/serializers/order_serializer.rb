class OrderSerializer
  include FastJsonapi::ObjectSerializer

  set_key_transform :dash
  attributes :order_type, :x, :y, :territory, :revealed, :special, :strength, :house_name

  belongs_to :game
  belongs_to :house

  attribute :order_type, &:type
  attribute :house_name do |object|
    object.house.name
  end
end
