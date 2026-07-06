# frozen_string_literal: true

module Decidim
  module BetterAccountability
    module OrganizationExtensions
      extend ActiveSupport::Concern

      included do
        def better_accountability_features_toggle
          @better_accountability_features_toggle ||= Decidim::Toggle.config_for(self, MODULE_NAME)
        end

        def better_accountability_enabled?
          !!better_accountability_features_toggle[:enabled]
        end
      end
    end
  end
end
