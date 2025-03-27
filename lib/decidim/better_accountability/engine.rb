# frozen_string_literal: true

module Decidim
  module BetterAccountability
    ##
    # Rails Engine that will mount better accountability participant-side.
    # No need to mount, decidim-* modules are mounted by default.
    class Engine < ::Rails::Engine
      isolate_namespace Decidim::BetterAccountability

      config.to_prepare do
        # Decorators&Overrides injections
        ::Decidim::Accountability::ResultsController.helper(::Decidim::BetterAccountability::BetterAccountabilityHelper)
      end

      initializer "decidim_better_accountability.add_view_cells" do
        Cell::ViewModel.view_paths << File.expand_path("#{Decidim::BetterAccountability::Engine.root}/app/cells")
        Cell::ViewModel.view_paths << File.expand_path("#{Decidim::BetterAccountability::Engine.root}/app/views")
      end
      initializer "decidim_beeter_accountability.icons" do 
        Decidim.icons.register(name: "layout-grid", icon: "layout-grid", category: "system", description: "", engine: :core)
      end
      initializer "decidim_better_accountability.webpacker.assets_path" do
        Decidim.register_assets_path File.expand_path("#{Decidim::BetterAccountability::Engine.root}/app/packs")
      end
    end
  end
end
