# frozen_string_literal: true

$LOAD_PATH.push File.expand_path("lib", __dir__)

require "decidim/better_accountability/version"

Gem::Specification.new do |s|
  s.version = Decidim::BetterAccountability.version
  s.authors = ["Hadrien Froger", "Renato Silva"]
  s.email = ["hadrien@octree.ch", "renato@octree.ch"]
  s.license = "AGPL-3.0"
  s.homepage = "https://git.octree.ch/decidim/vocacity/decidim-modules/decidim-module-better-accountability"
  s.required_ruby_version = ">= 3.0"

  s.name = "decidim-decidim_better_accountability"
  s.summary = "Display accountabilities in grid & add location to projects."
  s.description = "Improvements on the Decidim-Accountabilities module."

  s.files = Dir["{app,config,lib}/**/*", "LICENSE.md", "Rakefile", "README.md"]

  s.require_paths = ["lib"]
  s.add_dependency "decidim-accountability", Decidim::BetterAccountability.decidim_version
  s.add_dependency "decidim-admin", Decidim::BetterAccountability.decidim_version
  s.add_dependency "decidim-comments", Decidim::BetterAccountability.decidim_version
  s.add_dependency "decidim-core", Decidim::BetterAccountability.decidim_version
  s.add_dependency "deface", ">= 1.9.0"

  s.metadata["rubygems_mfa_required"] = "true"
end
