# frozen_string_literal: true

source "https://rubygems.org"

RUBY_VERSION = ">= 3.0"

ruby RUBY_VERSION

DECIDIM_VERSION = ENV.fetch("DECIDIM_VERSION", ">= 0.27.4")

gem "decidim", DECIDIM_VERSION
gem "decidim-decidim_better_accountability", path: "."

gem "bootsnap", "~> 1.4"
gem "puma", ">= 5.5.1"
gem "uglifier", "~> 4.1"

gem "deface", ">= 1.8.1"
gem "rubocop-faker"

group :development, :test do
  gem "byebug", "~> 11.0", platform: :mri

  gem "decidim-dev", DECIDIM_VERSION
end

group :test do
  gem "rspec-rails", "~> 4.0"
end

group :development do
  gem "faker", "~> 2.14"
  gem "letter_opener_web", "~> 1.3"
  gem "listen", "~> 3.1"
  gem "web-console", "4.0.4"
end
