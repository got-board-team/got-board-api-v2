FactoryGirl.define do
  factory :house do
    association :game
    association :blade_track
    association :raven_track
    association :throne_track
    association :supply_track
    association :victory_track

    name House::VALID_HOUSES.sample
    throne_position 1
    blade_position 5
    raven_position 4
    supply_position 2
    victory_position 2
  end
end
