class HouseCard < ApplicationRecord
  belongs_to :game
  belongs_to :house
end
