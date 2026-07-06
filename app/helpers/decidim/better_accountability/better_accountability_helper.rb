# frozen_string_literal: true

module Decidim
  module BetterAccountability
    module BetterAccountabilityHelper
      include Decidim::ApplicationHelper
      include Decidim::TranslationsHelper
      include Decidim::ResourceHelper

      def better_view_grid?
        better_view_params == "grid"
      end

      def better_view_percentage?
        better_view_params == "percentage"
      end

      def better_view_params
        @better_view_params ||= better_view_query || "grid"
      end

      def better_view_query
        @better_view_query ||= params.permit(:better_view)[:better_view]
      end

      def pagination_params
        params.permit(:per_page, :page)
      end

      def better_accountability_home_layout
        if Decidim::BetterAccountability.enabled?(current_organization)
          "layouts/decidim/better_accountability/around_home"
        else
          "layouts/decidim/shared/layout_two_col"
        end
      end

      def better_accountability_item_layout
        if Decidim::BetterAccountability.enabled?(current_organization)
          "layouts/decidim/better_accountability/layout_item"
        else
          "layouts/decidim/shared/layout_item"
        end
      end
    end
  end
end
