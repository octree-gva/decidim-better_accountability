# frozen_string_literal: true

require "spec_helper"

describe Decidim::BetterAccountability::BetterAccountabilityHelper do
  let(:helper_class) do
    Class.new do
      include Decidim::BetterAccountability::BetterAccountabilityHelper

      attr_accessor :params, :current_organization

      def initialize(params, organization)
        @params = params
        @current_organization = organization
      end
    end
  end

  let(:organization) { create(:organization) }
  let(:params) { ActionController::Parameters.new(better_view:) }
  let(:better_view) { nil }
  let(:helper) { helper_class.new(params, organization) }

  describe "#better_view_params" do
    it "defaults to grid" do
      expect(helper.better_view_params).to eq("grid")
    end

    context "when percentage is requested" do
      let(:better_view) { "percentage" }

      it "returns percentage" do
        expect(helper.better_view_params).to eq("percentage")
        expect(helper).to be_better_view_percentage
        expect(helper).not_to be_better_view_grid
      end
    end

    context "when grid is requested" do
      let(:better_view) { "grid" }

      it "returns grid" do
        expect(helper).to be_better_view_grid
        expect(helper).not_to be_better_view_percentage
      end
    end
  end

  describe "#better_accountability_home_layout" do
    it "returns the stock layout when disabled" do
      seed_better_accountability_toggle(organization, enabled: false)

      expect(helper.better_accountability_home_layout).to eq("layouts/decidim/shared/layout_two_col")
    end

    it "returns the better accountability layout when enabled" do
      seed_better_accountability_toggle(organization, enabled: true)

      expect(helper.better_accountability_home_layout).to eq("layouts/decidim/better_accountability/around_home")
    end
  end

  describe "#better_accountability_item_layout" do
    it "returns the stock layout when disabled" do
      seed_better_accountability_toggle(organization, enabled: false)

      expect(helper.better_accountability_item_layout).to eq("layouts/decidim/shared/layout_item")
    end

    it "returns the better accountability layout when enabled" do
      seed_better_accountability_toggle(organization, enabled: true)

      expect(helper.better_accountability_item_layout).to eq("layouts/decidim/better_accountability/layout_item")
    end
  end

  describe "#better_pagination_params" do
    let(:params) { ActionController::Parameters.new(page: "2", per_page: "10", other: "x") }

    it "permits pagination keys" do
      expect(helper.better_pagination_params.to_h).to eq("page" => "2", "per_page" => "10")
    end
  end
end
