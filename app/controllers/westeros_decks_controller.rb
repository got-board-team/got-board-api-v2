class WesterosDecksController < ApplicationController
  def reveal
    cards = WesterosDecks::Reveal.run!(game: game)
    serialized_cards = WesterosCardSerializer.new(cards).serialized_json

    # @todo Send the user that requested the reveal?
    cards.each do |card|
      Pusher.trigger("game", "westeros-reveal", game_id: game.id, name: card.title)
    end

    render json: serialized_cards
  end

  def shuffle
    WesterosDecks::Shuffle.run!(deck: deck)

    # @todo Send the user that requested the shuffle?
    Pusher.trigger("game", "westeros-shuffle", game_id: game.id, 42 => 42)
    head :no_content
  end

  private

  def deck
    @deck ||= game.westeros_decks.find_by(tier: params[:tier])
  end

  def game
    @game ||= Game.find(params[:game_id])
  end
end
