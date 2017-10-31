module Games
  class CreateNeutralForceTokens < ActiveInteraction::Base
    object :game

    def execute
      neutral_force_tokens_setup.map do |territory, sides|
        token = select_token_side(sides)
        next if token.blank?
        create_neutral_force(token, territory)
      end
      game.neutral_force_tokens
    end

    private

    def select_token_side(sides)
      sides.values.find do |side|
        Array(side["range"]).include?(game.houses.count)
      end
    end

    def neutral_force_tokens_setup
      @neutral_force_tokens_setup ||= begin
                                        file_path = "app/game_data/neutral_forces_tokens.yml"
                                        YAML.load_file(Rails.root.join(file_path))
                                      end
    end

    def determine_neutral_force_range(range)
      case range.respond_to?(:include?)
      when true
        range if range.include?(game.houses.count)
      when false
        range if range == game.houses.count
      end
    end

    def format_player_range(range)
      players_numbers = Array(range)
      return players_numbers.first if players_numbers.one?
      "#{players_numbers.first}-#{players_numbers.last}"
    end

    def create_neutral_force(token, territory)
      range = Array(token["range"])
      game.neutral_force_tokens.create(
        territory: territory,
        player_range: format_player_range(range),
        strength: token["strength"]
      )
    end
  end
end
