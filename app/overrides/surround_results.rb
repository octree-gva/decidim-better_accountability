# frozen_string_literal: true

Deface::Override.new(
  virtual_path: "decidim/accountability/results/home",
  name: "better_accountability_surround_home",
  replace: "erb[loud]:contains('layouts/decidim/shared/layout_two_col')",
  text: <<~ERB
    <%= render layout: better_accountability_home_layout do %>
  ERB
)

Deface::Override.new(
  virtual_path: "decidim/accountability/results/_result",
  name: "better_accountability_back_link",
  replace: "erb[loud]:contains('layouts/decidim/shared/layout_item')",
  text: <<~ERB
    <%= render layout: better_accountability_item_layout do %>
  ERB
)

Deface::Override.new(
  virtual_path: "decidim/accountability/results/index",
  name: "accountability_list",
  surround: "erb[loud]:contains('decidim_paginate results')",
  text: <<~ERB
    <%= render layout: "decidim/better_accountability/pagination_wrapper" do %>
      <%= render_original %>
    <% end %>
  ERB
)
