FactoryGirl.define do
  factory :influence_token do
    association :game
    association :influence_track
    association :house

    position { rand(1..6) }
  end
end
