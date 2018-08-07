module Games
  class CreateOrders < ActiveInteraction::Base
    object :game

    ORDERS = [
      { type: "MarchOrder", strength: -1, special: false },
      { type: "MarchOrder", strength: 0, special: false },
      { type: "MarchOrder", strength: 1, special: true },
      { type: "SupportOrder", strength: 0, special: false },
      { type: "SupportOrder", strength: 0, special: false },
      { type: "SupportOrder", strength: 1, special: true },
      { type: "RaidOrder", strength: 0, special: false },
      { type: "RaidOrder", strength: 0, special: false },
      { type: "RaidOrder", strength: 0, special: true },
      { type: "DefenseOrder", strength: 1, special: false },
      { type: "DefenseOrder", strength: 1, special: false },
      { type: "DefenseOrder", strength: 2, special: true },
      { type: "ConsolidationOrder", strength: 0, special: false },
      { type: "ConsolidationOrder", strength: 0, special: false },
      { type: "ConsolidationOrder", strength: 0, special: true }
    ].freeze

    def execute
      @orders_attributes = []

      game.houses.each { |house| build_orders_attributes(house.id) }

      Order.import(@orders_attributes, validate: false)
    end

    private

    def build_orders_attributes(house_id)
      ORDERS.each do |order|
        @orders_attributes << order.merge(
          game_id: game.id,
          house_id: house_id,
          revealed: false,
          x: 0,
          y: 0
        )
      end
    end
  end
end
