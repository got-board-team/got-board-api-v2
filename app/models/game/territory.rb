class Game
  class Territory
    include ActiveModel::Serialization
    include ActiveRecord::AttributeAssignment

    attr_reader :game
    attr_accessor :id,
                  :slug,
                  :boundaries,
                  :type,
                  :fortification_type,
                  :supply_icons,
                  :power_icons,
                  :house_sigil,
                  :names

    def initialize(game)
      @game = game
    end

    def game_id
      @game_id ||= game.id
    end
  end
end
