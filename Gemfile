# frozen_string_literal: true

source "https://rubygems.org"
"./"
"../../" if File.basename(__dir__) == "decidim_dummy_app"
"../" if File.basename(__dir__) == "development_app"

RUBY_VERSION = ">= 3.4.7"

ruby RUBY_VERSION

DECIDIM_VERSION = ENV.fetch("DECIDIM_VERSION", ">= 0.32")

gem "bootsnap", "~> 1.18"
gem "decidim", DECIDIM_VERSION
gem "decidim-decidim_better_accountability", path: base_path
gem "puma", ">= 6.6"
gem "uglifier", "~> 4.2"
gem "uri", "1.1.1"

gem "deface", ">= 1.9"
gem "rubocop-faker"

group :development, :test do
  gem "byebug", "~> 11.1", platform: :mri
  gem "decidim-dev", DECIDIM_VERSION
end

group :test do
  gem "capybara", "~> 3.40"
  gem "rspec-rails", "~> 6.0"
  gem "selenium-webdriver"
end

group :development do
  gem "faker", "~> 3.5"
  gem "letter_opener_web", "~> 3.0"
  gem "listen", "~> 3.9"
  gem "web-console", "~> 4.2"
end
