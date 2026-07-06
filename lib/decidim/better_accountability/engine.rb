# frozen_string_literal: true

require "deface"
require "decidim/toggle"

module Decidim
  module BetterAccountability
    ##
    # Rails Engine that will mount better accountability participant-side.
    # No need to mount, decidim-* modules are mounted by default.
    class Engine < ::Rails::Engine
      isolate_namespace Decidim::BetterAccountability

      initializer "decidim_better_accountability.ignore_deface_overrides_in_zeitwerk" do
        overrides_path = root.join("app/overrides").to_s
        Rails.autoloaders.main.ignore(overrides_path) if Dir.exist?(overrides_path)
      end

      config.to_prepare do
        Decidim::Organization.include(Decidim::BetterAccountability::OrganizationExtensions)

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

      initializer "decidim_better_accountability.organization_settings_tab",
                  after: "decidim_toggle.organization_settings_tabs" do
        Decidim::BetterAccountability::SettingsTab.register!
      end
    end
  end
end
