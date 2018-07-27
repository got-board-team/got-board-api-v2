module Games
  class CreateNeutralForceTokens < ActiveInteraction::Base
    object :game

    def execute
      game.neutral_force_tokens.import(tokens)
      game.neutral_force_tokens
    end

    private

    def tokens
      neutral_force_tokens_setup.map do |territory, token|
        attributes_for(territory, token)
      end.compact
    end

    def neutral_force_tokens_setup
      file_path = "app/game_data/neutral_forces_tokens.yml"
      YAML.load_file(
        Rails.root.join(file_path)
      )
    end

    def attributes_for(territory, token)
      side = select_token_side(token)
      return if side.blank?
      build_attributes(territory, token, side)
    end

    def select_token_side(token)
      token["sides"].values.find do |side|
        side["range"].include?(game.houses.count)
      end
    end

    def format_player_range(range)
      return range.first if range.one?
      "#{range.first}-#{range.last}"
    end

    def build_attributes(territory, token, side)
      {
        territory: territory,
        x: token["x"],
        y: token["y"],
        player_range: format_player_range(side["range"]),
        strength: side["strength"]
      }
    end
  end
end
