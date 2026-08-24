# frozen_string_literal: true

# Do not target layouts/decidim/_application: Deface cannot parse an open <body>.

Deface::Override.new(
  virtual_path: "layouts/decidim/_wrapper",
  name: "better_accountability_public_layout_container_data_attributes",
  set_attributes: "div.layout-container",
  original: %(<div class="layout-container">),
  attributes: Decidim::BetterAccountability::BodyDataAttributes.deface_attributes
)
