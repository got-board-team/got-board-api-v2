class WesterosDecksController < ApplicationController
  def reveal
    card = WesterosDecks::Reveal.run!(deck: deck)
    serialized_card = WesterosCardSerializer.new(card).serialized_json

    # @todo Send the user that requested the draw?
    Pusher.trigger("game", "westeros-draw", game_id: game.id, name: card.title)

    render json: serialized_card
  end

  def shuffle
    WesterosCards::Shuffle.run!(game: game)

    # @todo Send the user that requested the shuffle?
    Pusher.trigger("game", "westeros-shuffle", game_id: game.id, 42 => 42)
  end

  private

  def deck
    @deck ||= game.westeros_decks.find_by_tier(params[:deck_tier])
  end

  def game
    @game ||= Game.find(params[:game_id])
  end
end
