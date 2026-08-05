# frozen_string_literal: true

base_path = File.expand_path("..", __dir__)

Decidim::Shakapacker.register_path("#{base_path}/app/packs")
Decidim::Shakapacker.register_entrypoints(
  decidim_better_accountability: "#{base_path}/app/packs/entrypoints/decidim_better_accountability.js"
)
Decidim::Shakapacker.register_stylesheet_import("stylesheets/decidim/better_accountability/better_accountability")
