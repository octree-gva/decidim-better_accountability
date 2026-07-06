# frozen_string_literal: true

module Decidim
  module BetterAccountability
    module BodyDataAttributes
      module_function

      def deface_attributes
        {
          "data-better-accountability-enabled" => "<%= Decidim::BetterAccountability.enabled?(current_organization) %>"
        }
      end
    end
  end
end
