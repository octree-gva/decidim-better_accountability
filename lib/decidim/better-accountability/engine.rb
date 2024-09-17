# frozen_string_literal: true

module Decidim
  module BetterAccountability
    ##
    # Rails Engine that will mount better accountability participant-side.
    # No need to mount, decidim-* modules are mounted by default.
    class Engine < ::Rails::Engine
      isolate_namespace Decidim::BetterAccountability
      # routes do
      #   # Custom routes
      # end
      # config.to_prepare do
      #   # Decorators&Overrides injections
      # end
      # initializer "decidim_better_accountability.initialization" do
      # end
      initializer "decidim_better_accountability.add_view_cells" do
        Cell::ViewModel.view_paths << File.expand_path("#{Decidim::BetterAccountability::Engine.root}/app/cells")
      end

      initializer "decidim_better_accountability.webpacker.assets_path" do
        Decidim.register_assets_path File.expand_path("#{Decidim::BetterAccountability::Engine.root}/app/packs")
      end
    end
  end
end
