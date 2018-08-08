class TokenSerializer
  include FastJsonapi::ObjectSerializer

  set_key_transform :dash
  attributes :position, :x, :y

  belongs_to :game
  belongs_to :house

  attribute :token_type, &:type
  attribute :house_name do |object|
    object.house.name
  end
end
