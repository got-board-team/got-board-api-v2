FactoryGirl.define do
  factory :throne_track do
    association :game
    positions %w[baratheon lannister stark martell greyjoy tyrell]
  end
end
