FactoryGirl.define do
  factory :house do
    association :game

    name House::VALID_HOUSES.sample
  end
end
