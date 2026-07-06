# frozen_string_literal: true

require "decidim/better_accountability/better_accountability"
require "decidim/better_accountability/body_data_attributes"
require "decidim/better_accountability/organization_extensions"
require "decidim/better_accountability/settings_tab"
require "decidim/better_accountability/engine"
require "decidim/better_accountability/version"

module Decidim
  module BetterAccountability
    class Error < StandardError; end
  end
end
