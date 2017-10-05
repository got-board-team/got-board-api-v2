module Games
  class CreateHouses < ActiveInteraction::Base
    object :game
    integer :number_of_houses, default: 6

    def execute
      create_houses
      game.houses
    end

    private

    def create_houses
      house_names = House::VALID_HOUSES.first(number_of_houses)
      house_names.each do |house_name|
        game.houses.create(name: house_name)
      end
    end
  end
end
