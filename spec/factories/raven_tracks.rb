FactoryGirl.define do
  factory :raven_track do
    association :game
    positions %w[lannister stark martell baratheon tyrell greyjoy]
  end
end
