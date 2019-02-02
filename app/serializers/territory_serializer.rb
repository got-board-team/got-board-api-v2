class TerritorySerializer
  include FastJsonapi::ObjectSerializer

  set_key_transform :dash
  attributes :slug,
             :boundaries,
             :territory_type,
             :fortification_type,
             :supply_icons,
             :power_icons,
             :house_sigil,
             :names
end
