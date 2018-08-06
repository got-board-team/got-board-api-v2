require "rails_helper"

RSpec.describe Games::CreateWildlingCards do
  describe ".run" do
    let(:game) { Game.new }

    subject { described_class.run!(game: game) }

    it "builds collection of face-down wildling cards" do
      subject
      expect(game.wildling_cards.cards).to contain_exactly(
        { "name" => "crow_killers", "status" => "face-down" },
        { "name" => "the_horde_descends", "status" => "face-down" },
        { "name" => "a_king_beyond_the_wall", "status" => "face-down" },
        { "name" => "mammoth_riders", "status" => "face-down" },
        { "name" => "massing_on_the_milkwater", "status" => "face-down" },
        { "name" => "preemptive_raid", "status" => "face-down" },
        { "name" => "rattleshirts_raiders", "status" => "face-down" },
        { "name" => "silence_at_the_wall", "status" => "face-down" },
        "name" => "skinchanger_scout", "status" => "face-down"
      )
    end
  end
end
