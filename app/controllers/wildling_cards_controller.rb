class WildlingCardsController < ApplicationController
  def peek
    card = WildlingCards::Reveal.run!(game: game)
    serialized_card = WildlingCardSerializer.new(card).serialized_json
    Pusher.trigger("game", "wildling-peek", game_id: game.id, 42 => 42) # @todo Send the user that requested the peek

    render json: serialized_card
  end

  def hide
    WildlingCards::Hide.run!(game: game)
    Pusher.trigger("game", "wildling-hide", game_id: game.id, 42 => 42) # @todo Send the user that requested the hide?
  end

  def draw
    card = WildlingCards::Reveal.run!(game: game)
    serialized_card = WildlingCardSerializer.new(card).serialized_json

    # @todo Send the user that requested the draw?
    Pusher.trigger("game", "wildling-draw", game_id: game.id, name: card.name)

    render json: serialized_card
  end

  def move_to_bottom
    WildlingCards::MoveToBottom.run!(game: game)

    # @todo Send the user that requested the draw?
    Pusher.trigger("game", "wildling-move-to-bottom", game_id: game.id, 42 => 42)
  end

  def shuffle
    WildlingCards::Shuffle.run!(game: game)

    # @todo Send the user that requested the shuffle?
    Pusher.trigger("game", "wildling-shuffle", game_id: game.id, 42 => 42)
  end

  private

  def game
    @game ||= Game.find(params[:game_id])
  end
end
