# frozen_string_literal: true

require "spec_helper"

describe Decidim::BetterAccountability::BodyDataAttributes do
  describe ".deface_attributes" do
    subject(:attributes) { described_class.deface_attributes }

    it "includes the enabled data attribute" do
      expect(attributes).to include("data-better-accountability-enabled")
      expect(attributes["data-better-accountability-enabled"]).to include("Decidim::BetterAccountability.enabled?")
    end
  end
end
