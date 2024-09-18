module Decidim
    module BetterAccountability
        module BetterAccountabilityHelper
            include Decidim::ApplicationHelper
            include Decidim::TranslationsHelper
            include Decidim::ResourceHelper

            def better_view_grid?
                better_view_params === "grid"
            end

            def better_view_percentage?
                better_view_params == "percentage"
            end

            def better_view_params
                @better_view_params ||= params.permit(:better_view)[:better_view] || "grid"
            end

            def pagination_params
                params.permit(:per_page, :page)
            end
        end
    end
end