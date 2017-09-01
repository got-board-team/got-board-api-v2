class Game
  class Territory
    include ActiveRecord::AttributeAssignment

    attr_reader :game
    attr_accessor :id, :slug, :boundaries

    def initialize(game)
      @game = game
    end
  end
end
