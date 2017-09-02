FactoryGirl.define do
  factory :game do
    round 1
    wildling_threat 2
    throne_track %w[baratheon lannister stark martell greyjoy tyrell]
    blade_track %w[greyjoy tyrell martell stark baratheon lannister]
    raven_track %w[lannister stark martell baratheon tyrell greyjoy]
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
