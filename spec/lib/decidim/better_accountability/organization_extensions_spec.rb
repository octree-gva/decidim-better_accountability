# frozen_string_literal: true

require "spec_helper"

describe Decidim::BetterAccountability::OrganizationExtensions do
  subject(:organization) { create(:organization) }

  describe "#better_accountability_enabled?" do
    it "is false by default" do
      expect(organization.better_accountability_enabled?).to be(false)
    end

    it "reflects the toggle config" do
      seed_better_accountability_toggle(organization, enabled: true)

      expect(organization.better_accountability_enabled?).to be(true)
    end
  end

  describe "#better_accountability_features_toggle" do
    it "returns the module config hash" do
      seed_better_accountability_toggle(organization, enabled: true)

      expect(organization.better_accountability_features_toggle[:enabled]).to be(true)
    end
  end
end
