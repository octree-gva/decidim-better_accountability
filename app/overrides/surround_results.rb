# frozen_string_literal: true

Deface::Override.new(
  virtual_path: "decidim/accountability/results/home",
  name: "better_accountability_surround_home",
  replace: "erb[loud]:contains('layouts/decidim/shared/layout_two_col')",
  text: "<%= render layout: 'layouts/decidim/better_accountability/around_home' do %>"
)

Deface::Override.new(
  virtual_path: "decidim/accountability/results/_project",
  name: "better_accountability_back_link",
  replace: "erb[loud]:contains('layouts/decidim/shared/layout_item')",
  text: "<%= render layout: 'layouts/decidim/better_accountability/layout_item' do %>"
)

Deface::Override.new(
  virtual_path: "decidim/accountability/results/index",
  name: "accountability_list",
  surround: "erb[loud]:contains('decidim_paginate results')",
  text: "<div class='projects-list__pagination'><%= render_original %></div>"
)
