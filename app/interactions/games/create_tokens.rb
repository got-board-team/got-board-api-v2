module Games
  class CreateTokens < ActiveInteraction::Base
    INFLUENCE_TOKENS = %i[iron_throne_tokens fiefdom_tokens kings_court_tokens].freeze
    object :game

    def execute
      create_tokens
      adjust_tokens_by_number_of_houses
      game.tokens
    end

    private

    def create_tokens
      game.houses.each do |house|
        tokens = []
        houses_setup[house.name].each do |token, position|
          token_class = token.camelize.constantize
          tokens << token_class.new(game: game, house: house, position: position)
        end
        Token.import(tokens)
      end
    end

    def houses_setup
      @houses_setup ||= begin
                          file_path = "app/game_data/houses_setup.yml"
                          YAML.load_file(File.join(Rails.root, file_path))
                        end
    end

    def adjust_tokens_by_number_of_houses
      number_of_houses = game.houses
      return if number_of_houses == 6
      INFLUENCE_TOKENS.each do |influence_token|
        tokens = game.send(influence_token)
        tokens.sort_by(&:position).map.with_index do |token, index|
          token.position = index + 1
          token.save
        end
      end
    end
  end
end
