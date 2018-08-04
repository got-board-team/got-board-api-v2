source "https://rubygems.org"

# Modify Ruby version in travis file aswell
ruby "2.5.1"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "rails"

gem "active_interaction"
gem "active_model_serializers"
gem "dotenv-rails"
gem "pg"
gem "puma"
gem "pusher"
gem "rack-cors"
gem "sentry-raven"

group :development, :test do
  gem "awesome_print"
  gem "byebug"
  gem "factory_girl_rails"
  gem "pry-byebug"
  gem "rspec-rails"
end

group :development do
  gem "listen"
  gem "spring"
  gem "spring-commands-rspec"
  gem "spring-watcher-listen"
end

group :test do
  gem "fuubar"
  gem "shoulda-matchers", git: "https://github.com/thoughtbot/shoulda-matchers.git", branch: "rails-5"
  gem "timecop"
end
