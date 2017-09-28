class GamesController < ApplicationController
  before_action :find_game, only: :show

  def show
    render json: game, include: params[:include]
  end

  def create
    @game = Games::Create.run(number_of_houses: game_params[:number_of_houses]).result
    # Find way to redirect to show passing params[:include]
    respond_with @game
  end

  private

  attr_accessor :game

  def game_params
    params.permit(:number_of_houses)
  end

  def find_game
    @game = Game.find(params[:id])
  end
end
