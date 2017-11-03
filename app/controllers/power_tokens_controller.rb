class PowerTokensController < ApplicationController
  def update
    token = PowerToken.find(params[:id])
    token.update_attributes(power_token_params)
    render json: token
  end

  private

  def power_token_params
    params.require(:data).require(:attributes).permit(
      :x,
      :y,
      :territory,
      :available
    )
  end
end
