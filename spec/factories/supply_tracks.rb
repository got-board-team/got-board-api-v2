FactoryGirl.define do
  factory :supply_track do
    association :game

    positions do
      {
        "0" => [],
        "1" => %w[stark],
        "2" => %w[baratheon lannister greyjoy tyrell martell],
        "3" => [], "4" => [], "5" => [], "6" => []
      }
    end
  end
end
