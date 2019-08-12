class CombatController < ApplicationController
  def update
    payload = {
      attacker: nil,
      defender: nil,
      started: true
    }.to_json
    Pusher.trigger("game", "combat", type: "combat", payload: payload)
  end
end
