class WesterosCardSerializer
  include FastJsonapi::ObjectSerializer

  set_key_transform :dash
  attributes :title
end
