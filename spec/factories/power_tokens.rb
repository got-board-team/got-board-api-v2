FactoryBot.define do
  factory :power_token do
    association :game
    association :house
    available { true }
  end
end
