source "https://rubygems.org"

# Modify Ruby version in travis file aswell
ruby "2.6.1"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "rails"

gem "active_interaction"
gem "activerecord-import"
gem "acts_as_list"
gem "bcrypt"
gem "dotenv-rails"
gem "fast_jsonapi"
gem "jwt"
gem "pg"
gem "puma"
gem "pusher"
gem "rack-cors"
gem "rollbar"
gem "scout_apm"

group :development, :test do
  gem "faker"
  gem "awesome_print"
  gem "byebug"
  gem "factory_bot_rails", "~> 4.10"
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
  gem "codacy-coverage", require: false
  gem "fuubar"
  gem "shoulda-matchers", git: "https://github.com/thoughtbot/shoulda-matchers.git", branch: "rails-5"
  gem "simplecov", require: false
  gem "timecop"
end
