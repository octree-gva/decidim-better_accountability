# frozen_string_literal: true

require "spec_helper"

describe "Better accountability grid view toggle" do # rubocop:disable RSpec/DescribeClass
  include_context "with a component"

  let(:manifest_name) { "accountability" }
  let(:path) do
    decidim_participatory_process_accountability.root_path(
      participatory_process_slug: participatory_process.slug,
      component_id: component.id
    )
  end
  let!(:results) { create_list(:result, 2, component:) }
  let(:grid_label) { I18n.t("decidim.better_accountability.navigation.view.grid") }

  before do
    switch_to_host(organization.host)
  end

  context "when the better accountability toggle is disabled" do
    before do
      seed_better_accountability_toggle(organization, enabled: false)
      visit path
    end

    it "does not show the grid view menu" do
      expect(page).to have_no_css(".better_accountability__menu")
      expect(page).to have_no_content(grid_label)
    end
  end

  context "when the better accountability toggle is enabled" do
    before do
      seed_better_accountability_toggle(organization, enabled: true)
      visit path
    end

    it "shows the grid view menu" do
      expect(page).to have_css(".better_accountability__menu")
      expect(page).to have_link(grid_label)
    end

    it "keeps the menu when switching to the categories view" do
      click_on I18n.t("decidim.better_accountability.navigation.view.percentage")

      expect(page).to have_css(".better_accountability__menu")
      expect(page).to have_css(".better_accountability__menu li.active", text: I18n.t("decidim.better_accountability.navigation.view.percentage"))
    end
  end
end
