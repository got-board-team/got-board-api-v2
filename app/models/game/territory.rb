class Game
  class Territory
    include ActiveRecord::AttributeAssignment

    attr_reader :game
    attr_accessor :id, :slug, :boundaries, :type, :fortification_type
    attr_accessor :barrels_count, :crowns_count, :house_sigil, :names

    def initialize(game)
      @game = game
    end
  end
end
