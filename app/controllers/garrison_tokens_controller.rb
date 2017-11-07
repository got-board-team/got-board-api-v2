class GarrisonTokensController < ApplicationController
  include CurrentGame

  def update
    update_collection_with(:garrison_tokens, update_params)
  end

  private

  def update_params
    params.require(:data).require(:attributes).permit(
      :x,
      :y
    )
  end
end
