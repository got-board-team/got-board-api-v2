class PowerTokensController < ApplicationController
  include CurrentGame

  def update
    update_collection_with(:power_tokens, update_params)
  end

  private

  def update_params
    params.require(:data).require(:attributes).permit(
      :x,
      :y,
      :territory,
      :available
    )
  end
end
