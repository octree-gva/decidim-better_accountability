# frozen_string_literal: true

home_layout = "Decidim::BetterAccountability.enabled?(current_organization) " \
              "? 'layouts/decidim/better_accountability/around_home' " \
              ": 'layouts/decidim/shared/layout_two_col'"

Deface::Override.new(
  virtual_path: "decidim/accountability/results/home",
  name: "better_accountability_surround_home",
  replace: "erb[loud]:contains('layouts/decidim/shared/layout_two_col')",
  text: "<%= render layout: (#{home_layout}) do %>"
)

item_layout = "Decidim::BetterAccountability.enabled?(current_organization) " \
              "? 'layouts/decidim/better_accountability/layout_item' " \
              ": 'layouts/decidim/shared/layout_item'"

Deface::Override.new(
  virtual_path: "decidim/accountability/results/_project",
  name: "better_accountability_back_link",
  replace: "erb[loud]:contains('layouts/decidim/shared/layout_item')",
  text: "<%= render layout: (#{item_layout}) do %>"
)

pagination_surround = "<% if Decidim::BetterAccountability.enabled?(current_organization) %>" \
                      "<div class='projects-list__pagination'><%= render_original %></div>" \
                      "<% else %><%= render_original %><% end %>"

Deface::Override.new(
  virtual_path: "decidim/accountability/results/index",
  name: "accountability_list",
  surround: "erb[loud]:contains('decidim_paginate results')",
  text: pagination_surround
)
