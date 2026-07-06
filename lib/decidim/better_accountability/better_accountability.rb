# frozen_string_literal: true

module Decidim
  module BetterAccountability
    MODULE_NAME = "decidim_better_accountability"

    class << self
      def config = self

      def configure
        yield self
      end

      def enabled?(organization)
        return false if organization.blank?

        organization.better_accountability_enabled?
      end
    end
  end
end
