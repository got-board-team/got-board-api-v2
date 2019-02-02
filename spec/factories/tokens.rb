FactoryBot.define do
  factory :token do
    association :game
    association :house
    type { "iron_throne" }

    position { rand(1..6) }
  end
end
