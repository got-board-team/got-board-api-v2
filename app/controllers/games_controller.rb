class GamesController < ApplicationController
  before_action :find_game, only: :show

  def show
    render json: game, include: params[:include]
  end

  private

  attr_accessor :game

  def find_game
    @game = Game.find(params[:id])
  end
end
