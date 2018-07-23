class WildlingCardsController < ApplicationController
  def peek
    card = wildling_cards.first
    serializable_card = WildlingCard.new(name: card["name"])
    render json: serializable_card
  end

  def draw
    card = wildling_cards.shift
    serializable_card = WildlingCard.new(name: card["name"])
    wildling_cards.push(card)
    game.save
    render json: serializable_card
  end

  def shuffle
    wildling_cards.shuffle!
    game.save 
  end

  private

  def wildling_cards
    game.wildling_cards
  end

  def game
    @game ||= Game.find(params[:game_id])
  end
end
