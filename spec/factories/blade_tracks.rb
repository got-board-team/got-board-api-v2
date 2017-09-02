FactoryGirl.define do
  factory :blade_track do
    association :game
    positions %w[greyjoy tyrell martell stark baratheon lannister]
  end
end
