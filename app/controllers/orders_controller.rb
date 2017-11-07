class OrdersController < ApplicationController
  include CurrentGame

  def update
    update_collection_with(:orders, update_params)
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
end
