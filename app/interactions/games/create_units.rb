module Games
  class CreateUnits < ActiveInteraction::Base
    object :game

    def execute
      create_starting_units
      create_available_units
    end

    private

    def houses
      @houses ||= game.houses
    end

    def create_starting_units
      houses.each do |house|
        STARTING_UNITS[house.name].each do |unit|
          game.units.create(type: unit[:type],
                            territory: unit[:territory],
                            x: unit[:x], y: unit[:y],
                            house_id: house[:id])
        end
      end
    end

    def create_available_units
      create_remaining_units(:footmen, TOTAL_FOOTMEN_UNITS)
      create_remaining_units(:knights, TOTAL_KNIGHTS_UNITS)
      create_remaining_units(:ships, TOTAL_SHIPS_UNITS)
      create_remaining_units(:siege_engines, TOTAL_SIEGE_ENGINES_UNITS)
    end

    def create_remaining_units(unit_collection, total_units)
      houses.each do |house|
        remaining = total_units - house.send(unit_collection).count
        remaining.times { game.send(unit_collection).create(house_id: house.id) }
      end
    end

    # Rulebook page 2
    TOTAL_FOOTMEN_UNITS = 10
    TOTAL_KNIGHTS_UNITS = 5
    TOTAL_SHIPS_UNITS = 6
    TOTAL_SIEGE_ENGINES_UNITS = 2

    STARTING_UNITS = {
      baratheon: [
        { type: "Ship", territory: "shipbreaker_bay", x: 1262, y: 1985 },
        { type: "Ship", territory: "shipbreaker_bay", x: 1372, y: 2138 },
        { type: "Knight", territory: "dragonstone", x: 1392, y: 1797 },
        { type: "Footman", territory: "dragonstone", x: 1295, y: 1804 },
        { type: "Footman", territory: "kingswood", x: 1098, y: 2000 }
      ],
      lannister: [
        { type: "Ship", territory: "the_golden_sound", x: 133, y: 1759 },
        { type: "Knight", territory: "lannisport", x: 328, y: 1826 },
        { type: "Footman", territory: "lannisport", x: 348, y: 1690 },
        { type: "Footman", territory: "stoney_sept", x: 476, y: 1820 }
      ],
      stark: [
        { type: "Ship", territory: "the_shivering_sea", x: 1208, y: 738 },
        { type: "Knight", territory: "winterfell", x: 625, y: 851 },
        { type: "Footman", territory: "winterfell", x: 773, y: 544 },
        { type: "Footman", territory: "white_harbor", x: 852, y: 810 }
      ],
      greyjoy: [
        { type: "Ship", territory: "ironmans_bay", x: 87, y: 1557 },
        { type: "Ship", territory: "port_of_pyke", x: 325, y: 1350 },
        { type: "Knight", territory: "pyke", x: 198, y: 1472 },
        { type: "Footman", territory: "pyke", x: 281, y: 1479 },
        { type: "Footman", territory: "greywater_watch", x: 458, y: 1164 }
      ],
      tyrell: [
        { type: "Ship", territory: "redwyne_straights", x: 77, y: 2504 },
        { type: "Knight", territory: "highgarden", x: 389, y: 2171 },
        { type: "Footman", territory: "highgarden", x: 406, y: 2262 },
        { type: "Footman", territory: "dornish_marches", x: 498, y: 2308 }
      ],
      martell: [
        { type: "Ship", territory: "sea_of_dorne", x: 1121, y: 2475 },
        { type: "Knight", territory: "sunspear", x: 1010, y: 2600 },
        { type: "Footman", territory: "sunspear", x: 1107, y: 2611 },
        { type: "Footman", territory: "salt_shore", x: 814, y: 2698 }
      ]
    }.with_indifferent_access.freeze
  end
end
