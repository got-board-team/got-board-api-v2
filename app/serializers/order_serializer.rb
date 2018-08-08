class OrderSerializer
  include FastJsonapi::ObjectSerializer

  set_key_transform :dash
  attributes :type, :x, :y, :territory, :revealed, :special, :strength, :house_name

  belongs_to :game
  belongs_to :house

  attribute :house_name do |object|
    object.house.name
  end
end
