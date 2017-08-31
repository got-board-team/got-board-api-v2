source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "rails", "~> 5.1.3"

gem "active_interaction", "~> 3.5"
gem "dotenv-rails", "~> 2.2.0"
gem "jb", ">= 0.4", "< 1.0.0"
gem "pg", "~> 0.18"
gem "puma", "~> 3.7"
gem "rack-cors"

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
  gem "timecop", "~> 0.9"
end
