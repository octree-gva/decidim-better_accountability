# frozen_string_literal: true


Deface::Override.new(
  virtual_path: "decidim/accountability/results/home",
  name: "better_accountability_surround_home",
  surround: ".row.accountability",
  partial: "decidim/better_accountability/around_home"
)
