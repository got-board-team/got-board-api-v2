class NeutralForceTokenSerializer
  include FastJsonapi::ObjectSerializer

  set_key_transform :dash
  attributes :territory, :x, :y, :player_range, :strength, :defeated
end
