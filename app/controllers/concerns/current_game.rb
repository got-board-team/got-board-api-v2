module CurrentGame
  extend ActiveSupport::Concern

  def game
    @game ||= Game.find(params[:game_id])
  end

  def update_collection_with(collection, record_attributes)
    record = game.send(collection).find(params[:id])
    record.update_attributes(record_attributes)
    Pusher.trigger("game", "update", id: record.id, type: record.model_name.to_s, attributes: record_attributes)
    render json: record
  end
end
