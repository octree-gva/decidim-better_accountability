# frozen_string_literal: true

Deface::Override.new(
  virtual_path: "layouts/decidim/_application",
  name: "better_accountability_public_body_data_attributes",
  set_attributes: "body",
  attributes: Decidim::BetterAccountability::BodyDataAttributes.deface_attributes
)
