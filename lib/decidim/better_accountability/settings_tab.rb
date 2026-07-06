# frozen_string_literal: true

module Decidim
  module BetterAccountability
    class SettingsTab
      def self.register!
        Decidim::Toggle.settings_tabs :organization_settings do |tabs|
          tabs.add_tab :decidim_better_accountability,
                       I18n.t("decidim_toggle.system.#{MODULE_NAME}.tab"),
                       form: Decidim::BetterAccountability::Admin::ConfigForm,
                       command: Decidim::Toggle::UpdateModuleConfigCommand,
                       module_name: MODULE_NAME,
                       position: 16
        end
      end
    end
  end
end
