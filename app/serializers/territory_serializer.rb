class TerritorySerializer
  include FastJsonapi::ObjectSerializer

  set_key_transform :dash
  attributes :game_id,
             :slug,
             :boundaries,
             :type,
             :fortification_type,
             :supply_icons,
             :power_icons,
             :house_sigil,
             :names
end
