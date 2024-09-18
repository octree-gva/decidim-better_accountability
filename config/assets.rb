# frozen_string_literal: true

base_path = File.expand_path("..", __dir__)

Decidim::Webpacker.register_path("#{base_path}/app/packs")
Decidim::Webpacker.register_entrypoints(
  decidim_better_accountability: "#{base_path}/app/packs/entrypoints/decidim_better_accountability.js"
)
Decidim::Webpacker.register_stylesheet_import("stylesheets/decidim/better_accountability/better_accountability")
