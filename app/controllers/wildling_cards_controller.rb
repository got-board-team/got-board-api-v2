# @todo spec
class WildlingCardsController < ApplicationController
  def peek
    render json: game.wildling_cards.peek
  end

  def draw
    card = wildling_cards.cards.shift
    serializable_card = WildlingCard.new(name: card["name"])
    wildling_cards.cards.push(card)
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
