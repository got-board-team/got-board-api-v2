source "https://rubygems.org"

ruby "2.4.2"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "rails", "~> 5.1.3"

gem "active_interaction", "~> 3.5"
gem "active_model_serializers", "~> 0.10.0"
gem "dotenv-rails", "~> 2.2.0"
gem "pg", "~> 0.18"
gem "puma", "~> 3.7"
gem "rack-cors", "~> 1.0"
gem "sentry-raven", "~> 2.6"

group :development, :test do
  gem "awesome_print", "~> 1.8"
  gem "byebug"
  gem "factory_girl_rails", "~> 4.8"
  gem "pry-byebug", "~> 3.5"
  gem "rspec-rails", "~> 3.6"
end

group :development do
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-commands-rspec", "~> 1.0"
  gem "spring-watcher-listen", "~> 2.0.0"
end

group :test do
  gem "fuubar", "~> 2.2.0"
  gem "shoulda-matchers", git: "https://github.com/thoughtbot/shoulda-matchers.git", branch: "rails-5"
  gem "timecop", "~> 0.9"
end
