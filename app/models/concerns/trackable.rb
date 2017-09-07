module Trackable
  extend ActiveSupport::Concern

  included do
    belongs_to :game

    has_many :houses

    validate :house_uniqueness_in_track
    validate :invalid_houses_presence_in_track
  end
end
