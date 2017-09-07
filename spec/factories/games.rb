FactoryGirl.define do
  factory :game do
    round 1
    wildling_threat 2

    trait :with_influence_tracks do
      after(:build) do |game, _|
        %i[blade raven throne].map do |type|
          build("#{type}_track".to_sym, game: game)
        end
      end
    end
  end
end
