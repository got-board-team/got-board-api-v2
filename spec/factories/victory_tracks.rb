FactoryGirl.define do
  factory :victory_track do
    association :game

    positions do
      {
        "0" => [],
        "1" => %w[baratheon lannister greyjoy tyrell martell],
        "2" => %w[stark],
        "3" => [], "4" => [], "5" => [], "6" => []
      }
    end
  end
end
