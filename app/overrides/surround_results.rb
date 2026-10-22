# frozen_string_literal: true

Deface::Override.new(
  virtual_path: "decidim/accountability/results/home",
  name: "better_accountability_surround_home",
  replace: "erb[loud]:contains('layouts/decidim/shared/layout_two_col')",
  text: "<%= render layout: 'layouts/decidim/better_accountability/around_home' do %>"
)

# 0.29 renders _project; 0.30+ renders _result. Register only the partial that exists.
accountability_views = Gem.loaded_specs.fetch("decidim-accountability").full_gem_path
%w(_project _result).each do |partial|
  view = File.join(accountability_views, "app/views/decidim/accountability/results/#{partial}.html.erb")
  next unless File.exist?(view)

  Deface::Override.new(
    virtual_path: "decidim/accountability/results/#{partial}",
    name: "better_accountability_back_link",
    replace: "erb[loud]:contains('layouts/decidim/shared/layout_item')",
    text: "<%= render layout: 'layouts/decidim/better_accountability/layout_item' do %>"
  )
end

Deface::Override.new(
  virtual_path: "decidim/accountability/results/index",
  name: "accountability_list",
  surround: "erb[loud]:contains('decidim_paginate results')",
  text: "<div class='projects-list__pagination'><%= render_original %></div>"
)
