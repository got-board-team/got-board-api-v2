class HouseSerializer
  include FastJsonapi::ObjectSerializer

  set_key_transform :dash
  attributes :name

  belongs_to :game
end
