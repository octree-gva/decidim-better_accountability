# frozen_string_literal: true

require "spec_helper"

describe Decidim::BetterAccountability do
  describe ".enabled?" do
    let(:organization) { create(:organization) }

    it "returns false when the organization is blank" do
      expect(described_class.enabled?(nil)).to be(false)
    end

    it "returns false when the toggle is not enabled" do
      seed_better_accountability_toggle(organization, enabled: false)

      expect(described_class.enabled?(organization)).to be(false)
    end

    it "returns true when the toggle is enabled" do
      seed_better_accountability_toggle(organization, enabled: true)

      expect(described_class.enabled?(organization)).to be(true)
    end
  end
end
