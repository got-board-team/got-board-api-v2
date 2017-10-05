# @todo spec
module Games
  class CreateOrders < ActiveInteraction::Base
    object :game

    def execute
      game.houses.each do |house|
        ORDERS.each do |order_type, orders|
          orders.each do |order|
            attrs = order.merge(order_attrs(order_type, house.game_id))
            house.orders.create(attrs)
          end
        end
      end
      game.orders
    end

    private

    def order_attrs(type, game_id)
      {
        type: "#{type}Order",
        game_id: game_id,
        revealed: false,
        x: 0,
        y: 0
      }
    end

    ORDERS =
      {
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
  end
end
