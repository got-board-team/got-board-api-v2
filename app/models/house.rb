class House < ApplicationRecord
  VALID_HOUSES = %w[baratheon lannister stark greyjoy tyrell martell].freeze

  belongs_to :game
  belongs_to :blade_track
  belongs_to :raven_track
  belongs_to :throne_track

  # @todo Eventually will belong_to :user?
  # @todo Eventually will have_many :house_cards/cards?

  validates_inclusion_of :victory_position, in: 0..7
  validates_inclusion_of :supply_position, in: 0..6
  validates_inclusion_of :blade_position, in: 1..6
  validates_inclusion_of :raven_position, in: 1..6
  validates_inclusion_of :throne_position, in: 1..6
  validates_inclusion_of :name, in: VALID_HOUSES

  validates_uniqueness_of :name, scope: :game_id

  # @todo spec
  before_save :update_tracks, if: :position_changed?

  private

  # @todo Implement
  def update_tracks
    position_changes.map do |track|
      # Update tracks with new positions
    end
  end

  def position_changed?
    position_changes.any?
  end

  def position_changes
    %i[victory supply blade raven throne].map do |track|
      track if send("#{track}_position_changed?")
    end.compact
  end
end
