source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.5.1"

gem "bootsnap", ">= 1.1.0", require: false
gem "coffee-rails", "~> 4.2"
gem "devise"
gem "draft_generators", git: "https://github.com/firstdraft/draft_generators"
gem "faker", github: "stympy/faker"
gem "jbuilder", "~> 2.5"
gem "puma", "~> 3.11"
gem "rails", "~> 5.2.1"
gem "rollbar"
gem "ruby-measurement"
gem "sass-rails", "~> 5.0"
gem "skylight"
gem "turbolinks", "~> 5"
gem "uglifier", ">= 1.3.0"
gem "unitwise"

group :development, :test do
  gem "byebug", platforms: %i[mri mingw x64_mingw]
  gem "factory_bot_rails"
  gem "sqlite3", "1.3.13"
end

group :development do
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "rails-erd"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
end

group :production do
  gem "pg", "~> 0.18"
  gem "rails_12factor"
end

group :test do
  gem "capybara", ">= 2.15"
  gem "chromedriver-helper"
  gem "selenium-webdriver"
end

gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
