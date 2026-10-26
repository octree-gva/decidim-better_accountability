# frozen_string_literal: true

module Decidim
  module BetterAccountability
    def self.version
      "0.2.0" # DO NOT UPDATE MANUALLY
    end

    def self.decidim_version
      [">= 0.29", "< 0.33"].freeze
    end
  end
end
