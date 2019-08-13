class CombatController < ApplicationController
  include CurrentGame

  def update
    Pusher.trigger("game", "combat", id: params[:id], type: "combat", attributes: update_params)
    render json: update_params
  end

  def update_params
    params.require(:data).require(:attributes).permit(
      :started,
      :revealed,
      choosenCard: [:id, :name, :houseName]
    )
  end
end
