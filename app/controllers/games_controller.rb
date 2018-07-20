# @todo spec
class GamesController < ApplicationController
  before_action :find_game, only: :show

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

  private

  attr_accessor :game

  def game_params
    params.require(:game).permit(:number_of_houses)
  end

  def find_game
    @game = Game.find(params[:id])
  end
end
