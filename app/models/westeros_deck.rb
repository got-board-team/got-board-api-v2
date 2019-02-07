class WesterosDeck < ApplicationRecord
  belongs_to :game
  has_many :westeros_cards, -> { order(position: :asc) }

  validates_numericality_of :tier, greater_than_or_equal_to: 1, less_than_or_equal_to: 3
end
