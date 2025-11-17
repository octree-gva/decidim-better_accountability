# frozen_string_literal: true

source "https://rubygems.org"
base_path = "./"
base_path = "../../" if File.basename(__dir__) == "decidim_dummy_app"
base_path = "../" if File.basename(__dir__) == "development_app"

RUBY_VERSION = ">= 3.2.2"

ruby RUBY_VERSION

DECIDIM_VERSION = ENV.fetch("DECIDIM_VERSION", ">= 0.29.5")

gem "decidim", DECIDIM_VERSION
gem "decidim-decidim_better_accountability", path: base_path

gem "bootsnap", "~> 1.18"
gem "puma", ">= 6.6"
gem "uglifier", "~> 4.2"

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
