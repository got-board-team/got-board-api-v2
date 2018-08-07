namespace :db do
  task populate: :environment do
    ITERATIONS = 500
    ITERATIONS.times do |index|
      Games::Create.run!(number_of_houses: 6)
      p "#{index + 1} / #{ITERATIONS}"
    end
  end
end
