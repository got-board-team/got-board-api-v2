FactoryBot.define do
  factory :order do
    association :game
    association :house

    special { false }

    trait :march do
      type { :march }
    end
  end
end
