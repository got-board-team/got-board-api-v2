class WildlingCardSerializer
  include FastJsonapi::ObjectSerializer

  set_key_transform :dash
  attributes :name, :status
end
