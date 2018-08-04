# @todo spec
module Games
  class CreateOrders < ActiveInteraction::Base
    object :game

    ORDERS = {
      March: [
        { strength: -1, special: false },
        { strength: 0, special: false },
        { strength: 1, special: true }
      ],
      Support: [
        { strength: 0, special: false },
        { strength: 0, special: false },
        { strength: 1, special: true }
      ],
      Raid: [
        { strength: 0, special: false },
        { strength: 0, special: false },
        { strength: 0, special: true }
      ],
      Defense: [
        { strength: 1, special: false },
        { strength: 1, special: false },
        { strength: 2, special: true }
      ],
      Consolidation: [
        { strength: 0, special: false },
        { strength: 0, special: false },
        { strength: 0, special: true }
      ]
    }.freeze

    def execute
      orders_attributes = []
      game.houses.each do |house|
        ORDERS.each do |order_type, orders|
          orders.each do |order|
            orders_attributes << order.merge(attributes(order_type, house.id))
          end
        end
      end
      Order.import(orders_attributes, validate: false)
    end

    private

    def attributes(type, house_id)
      {
        type: "#{type}Order",
        game_id: game.id,
        house_id: house_id,
        revealed: false,
        x: 0,
        y: 0
      }
    end
  end
end
