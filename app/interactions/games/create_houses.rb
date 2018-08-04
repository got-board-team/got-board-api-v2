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
      houses = []
      house_names.each do |house_name|
        houses << game.houses.build(name: house_name)
      end
      House.import(houses)
    end
  end
end
