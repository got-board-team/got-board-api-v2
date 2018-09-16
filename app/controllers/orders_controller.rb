class OrdersController < ApplicationController
  include CurrentGame

  def update
    update_collection_with(:orders, update_params)
  end

  def bulk_update
    orders = game.orders.where(filter_params)
    orders.update_all(bulk_update_params.to_hash)
    rendered = render json: orders
    Pusher.trigger("game", "bulk-update", type: "orders", payload: rendered)
  end

  private

  def update_params
    params.require(:data).require(:attributes).permit(
      :x,
      :y,
      :territory,
      :revealed
    )
  end

  def bulk_update_params
    params.require(:data).require(:attributes).permit(
      :territory,
      :revealed
    )
  end

  def filter_params
    params.require(:filter).permit(:house_id)
  end
end
