# frozen_string_literal: true

require "decidim/gem_manager"

namespace :decidim_better_accountability do
  namespace :webpacker do
    desc "Installs Better Accountability webpacker files in Rails instance application"
    task install: :environment do
      raise "Decidim gem is not installed" if decidim_path.nil?

      install_better_accountability_npm
    end

    desc "Adds Better Accountability dependencies in package.json"
    task upgrade: :environment do
      raise "Decidim gem is not installed" if decidim_path.nil?

      install_better_accountability_npm
    end

    def install_better_accountability_npm
      return if better_accountability_npm_dependencies.empty?

      puts "install NPM packages. You can also do this manually with this command:"
      puts "npm i #{better_accountability_npm_dependencies.join(" ")}"
      better_accountability_system! "npm i #{better_accountability_npm_dependencies.join(" ")}"
    end

    def better_accountability_npm_dependencies
      @better_accountability_npm_dependencies ||= if better_accountability_path.nil? || !File.exist?(better_accountability_path.join("package.json"))
                                                    []
                                                  else
                                                    package_json = JSON.parse(File.read(better_accountability_path.join("package.json")))
                                                    (package_json["dependencies"] || {}).map { |package, version| "#{package}@#{version}" }
                                                  end
    end

    def better_accountability_path
      @better_accountability_path ||= Pathname.new(better_accountability_gemspec.full_gem_path) if Gem.loaded_specs.has_key?(better_accountability_gem_name)
    end

    def rails_app_path
      @rails_app_path ||= Rails.root
    end

    def better_accountability_system!(command)
      system("cd #{rails_app_path} && #{command}") || abort("\n== Command #{command} failed ==")
    end

    def better_accountability_gemspec
      @better_accountability_gemspec ||= Gem.loaded_specs[better_accountability_gem_name]
    end

    def better_accountability_gem_name
      "decidim-decidim_better_accountability"
    end
  end
end
