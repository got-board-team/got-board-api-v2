class TerritorySerializer < ActiveModel::Serializer
  attributes :id,
             :game_id,
             :slug,
             :boundaries,
             :type,
             :fortification_type,
             :supply_icons,
             :power_icons,
             :house_sigil,
             :names
end
