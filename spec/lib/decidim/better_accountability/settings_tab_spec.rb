# frozen_string_literal: true

require "spec_helper"

describe Decidim::BetterAccountability::SettingsTab do
  describe ".register!" do
    it "registers the better accountability organization settings tab" do
      registry = Decidim::Toggle::SettingsTabRegistry.find(:organization_settings)
      tab = registry.form_tab(:decidim_better_accountability)
      module_tab = registry.form_tab_for_module(Decidim::BetterAccountability::MODULE_NAME)

      expect(tab[:form]).to eq(Decidim::BetterAccountability::Admin::ConfigForm)
      expect(module_tab[:form]).to eq(Decidim::BetterAccountability::Admin::ConfigForm)
      expect(module_tab[:tab_identifier]).to eq(:decidim_better_accountability)
    end
  end
end
