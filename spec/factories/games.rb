FactoryGirl.define do
  factory :game do
    round 1
    wildling_threat 2
    victory_track do
      {
        0 => [],
        1 => %w[baratheon lannister greyjoy tyrell martell],
        2 => %w[stark],
        3 => [],
        4 => [],
        5 => [],
        6 => []
      }
    end
    supply_track do
      {
        0 => [],
        1 => %w[stark],
        2 => %w[baratheon lannister greyjoy tyrell martell],
        3 => [],
        4 => [],
        5 => [],
        6 => []
      }
    end
  end
end
