class TokenSerializer
  include FastJsonapi::ObjectSerializer

  set_key_transform :dash
  attributes :token_type, :position, :x, :y, :house_name

  belongs_to :game
  belongs_to :house

  attribute :token_type, &:type
  attribute :house_name do |object|
    object.house.name
  end
end
