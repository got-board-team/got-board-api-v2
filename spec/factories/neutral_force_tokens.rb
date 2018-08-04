FactoryBot.define do
  factory :neutral_force_token do
    association :game
    territory "eyrie"
    player_range "4-6"
    strength 6
  end
end
