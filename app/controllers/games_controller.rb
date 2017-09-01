class GamesController < ApplicationController
  before_action :find_game, only: :show

  def show
    render json: @game, include: [params[:include]]
  end

  private

  def find_game
    @game = Game.find(params[:id])
  end
end
