# frozen_string_literal: true

module BetterAccountabilityToggleHelpers
  def seed_better_accountability_toggle(organization, enabled:)
    Decidim::Toggle.save_config!(
      organization,
      Decidim::BetterAccountability::MODULE_NAME,
      { "enabled" => enabled }
    )
  end
end

RSpec.configure do |config|
  config.include BetterAccountabilityToggleHelpers
end
