class NeutralForceTokensController < ApplicationController
  include CurrentGame

  def update
    update_collection_with(:neutral_force_tokens, update_params)
  end

  private

  def update_params
    params.require(:data).require(:attributes).permit(
      :x,
      :y
    )
  end
end
