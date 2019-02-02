# @todo spec
class GamesController < ApplicationController
  before_action :find_game, only: %i[show update]

  def show
    render json: serialized_game
  end

  def create
    @game = Games::Create.run(number_of_houses: game_params[:number_of_houses]).result
    render json: serialized_game
  end

  def update
    game.update_attributes(update_params)
    Pusher.trigger("game",
                   "update",
                   id: game.id,
                   type: game.model_name.to_s,
                   attributes: update_params)
    render json: serialized_game
  end

  private

  attr_accessor :game

  def include_params
    params[:include]&.split(",")
  end

  def game_params
    params.require(:game).permit(:number_of_houses)
  end

  def update_params
    params.require(:data).require(:attributes).permit(
      :round,
      :wildling_threat
    )
  end

  def serialized_game
    GameSerializer.new(game, include: include_params).serialized_json
  end

  def find_game
    @game = Game.find(params[:id])
  end
end
