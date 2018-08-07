class WildlingCard < ApplicationRecord
  STATUSES = %w[face-down revealed].freeze

  belongs_to :game

  validates_presence_of :name
  validates_inclusion_of :status, in: STATUSES

  acts_as_list scope: :game

  # @todo spec
  def self.revealed
    find_by(status: "revealed")
  end
end
