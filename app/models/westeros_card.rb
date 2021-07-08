class WesterosCard < ApplicationRecord
  belongs_to :westeros_deck

  validates_presence_of :title

  acts_as_list scope: :westeros_deck
end
