module Games
  class CreateNeutralForceTokens < ActiveInteraction::Base
    object :game

    def execute
      number_of_houses = game.houses.count
      neutral_force_tokens_setup.map do |territory, range_of_houses|
        next if range_of_houses.flatten.exclude?(number_of_houses)
        create_neutral_force(range_of_houses, territory)
      end
      game.neutral_force_tokens
    end

    private

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

    def create_neutral_force(range_of_houses, territory)
      range_of_houses.map do |range|
        next if determine_neutral_force_range(range).blank?
        game.neutral_force_tokens.create(territory: territory)
      end
    end
  end
end
