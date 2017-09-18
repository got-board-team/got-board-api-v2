class InfluenceToken < ApplicationRecord
  belongs_to :game
  belongs_to :influence_track, polymorphic: true
  belongs_to :house
end
