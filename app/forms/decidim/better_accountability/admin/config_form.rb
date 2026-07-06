# frozen_string_literal: true

module Decidim
  module BetterAccountability
    module Admin
      class ConfigForm < Decidim::Form
        include Decidim::Toggle::TabForm
        include Decidim::Toggle::ModuleConfigForm

        self.module_config_name = MODULE_NAME

        mimic :organization

        attribute :enabled, :boolean, default: false
      end
    end
  end
end
