class TokensController < ApplicationController
  include CurrentGame

  def update
    update_collection_with(:tokens, update_params)
  end

  private

  def update_params
    params.require(:data).require(:attributes).permit(
      :x,
      :y,
      :position,
    )
  end
end
