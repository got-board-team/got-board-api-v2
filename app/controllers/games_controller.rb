# @todo spec
class GamesController < ApplicationController
  before_action :find_game, only: %i[show update]

  def index
    render json: Game.all, include: params[:include]
  end

  def show
    render json: game, include: params[:include]
  end

  def create
    @game = Games::Create.run(number_of_houses: game_params[:number_of_houses]).result
    render json: @game, include: "**"
  end

  def update
    @game.update_attributes(update_params)
    Pusher.trigger("game",
                   "update",
                   id: game.id,
                   type: game.model_name.to_s,
                   attributes: update_params)
    render json: @game
  end

  private

  attr_accessor :game

  def game_params
    params.permit(:number_of_houses)
  end

  def update_params
    params.require(:data).require(:attributes).permit(
      :round,
      :wildling_threat
    )
  end

  def find_game
    @game = Game.find(params[:id])
  end
end
