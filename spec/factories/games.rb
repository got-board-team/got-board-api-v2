FactoryBot.define do
  factory :game do
    round 1
    wildling_threat 2

    trait :with_territories do
      after(:build, :stub) { Territories::Import.run! }
    end
  end
end
