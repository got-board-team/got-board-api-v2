class CombatController < ApplicationController
  include CurrentGame

  def update
    output_json = update_params
    output_json[:game_id] = params[:data][:game_id]
    output_json[:house_name] = params[:data][:house_name]

    Pusher.trigger("game", "combat", game_id: output_json[:game_id], type: "combat", house_name: output_json[:house_name], attributes: update_params)

    puts "\n\n\n#{params}\n\n#{update_params}\n\n#{output_json}\n\n\n"
    render json: output_json
  end

  def update_params
    params.require(:data).require(:attributes).permit(
      :started,
      :reset,
      :revealed,
      choosenCard: [:id, :name, :houseName]
    )
  end
end
