class NeutralForceTokenSerializer < ActiveModel::Serializer
  attributes :territory, :x, :y, :player_range, :strength, :defeated
end
