FactoryBot.define do
  factory :user do
    name { Faker::TvShows::GameOfThrones.character }
    password { '123456' }
    password_confirmation { '123456' }
    sequence(:email) { |n| "email#{n}@email.com" }

    trait :invalid_email do
      email { 'email.com' }
    end
  end
end
