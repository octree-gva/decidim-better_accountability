# frozen_string_literal: true

ENV["RAILS_ENV"] = "test"
ENV["NODE_ENV"] ||= "test"
ENV["ENGINE_ROOT"] = File.dirname(__dir__)
ENV["DECIDIM_AVAILABLE_LOCALES"] = "en,ca,es,fr"
ENV["DECIDIM_DEFAULT_LOCALE"] = "en"

require "i18n"
require "decidim/dev"

Decidim::Dev.dummy_app_path = File.expand_path(File.join(__dir__, "decidim_dummy_app"))

require "decidim/dev/test/base_spec_helper"

available_locales = ENV["DECIDIM_AVAILABLE_LOCALES"].split(",").map { |locale| locale.strip.to_sym }
I18n.available_locales = available_locales
I18n.default_locale = ENV["DECIDIM_DEFAULT_LOCALE"].to_sym
I18n.enforce_available_locales = false

require_relative "factories"

Dir[File.expand_path("support/**/*.rb", __dir__)].each { |f| require f }
