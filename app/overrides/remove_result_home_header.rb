# frozen_string_literal: true

Deface::Override.new(
  virtual_path: "decidim/accountability/results/_home_header",
  name: "better_accountability_surround_home_header",
  surround: "erb[silent]:contains('progress_calculator')",
  closing_selector: "erb[silent]:contains('end')",
  text: "<% if better_view_percentage? %><%= render_original %><% end %>"
)
