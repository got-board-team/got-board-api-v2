class TerritorySerializer < ActiveModel::Serializer
  attributes :id,
             :slug,
             :boundaries,
             :territory_type,
             :fortification_type,
             :supply_icons,
             :power_icons,
             :house_sigil,
             :names
end
