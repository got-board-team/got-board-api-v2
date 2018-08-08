module Territories
  class Import < ActiveInteraction::Base
    def execute
      ensure_clean_database!
      Territory.import(territories)
    end

    private

    def ensure_clean_database!
      msg = "Database already has Territories. Destroy them before proceeding."
      raise ArgumentError, msg if Territory.exists?
    end

    def territories
      YAML.load_file(
        Rails.root.join("app/game_data/territories.yml")
      )
    end
  end
end
