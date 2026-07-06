# frozen_string_literal: true

require "decidim/dev/common_rake"
require "rake/file_utils"
require "yaml"

DEFAULT_DATABASE_HOST = "better-accountability-pg"

def database_host
  host = ENV.fetch("DATABASE_HOST", DEFAULT_DATABASE_HOST)
  return DEFAULT_DATABASE_HOST if host == "pg"

  host
end

def install_module(path)
  Dir.chdir(path) do
    sh "bundle exec rails decidim_toggle:install:migrations"
    sh "bundle exec rails decidim:update"
  end
end

def with_test_database_env
  ENV.delete("DATABASE_URL")
  ENV["DATABASE_HOST"] = database_host
  ENV["DISABLE_SPRING"] = "1"
  ENV["RAILS_ENV"] = "development"
  yield
end

def common_db_config
  {
    "adapter" => "postgresql",
    "encoding" => "unicode",
    "host" => database_host,
    "port" => ENV.fetch("DATABASE_PORT", "5432").to_i,
    "username" => ENV.fetch("DATABASE_USERNAME", "decidim"),
    "password" => ENV.fetch("DATABASE_PASSWORD", "pleaseChangeMe"),
    "database" => "#{base_app_name}_test_app"
  }
end

def write_test_database_yml
  config_file = File.expand_path("spec/decidim_dummy_app/config/database.yml", __dir__)
  File.open(config_file, "w") { |f| YAML.dump({ "test" => common_db_config, "development" => common_db_config }, f) }
end

def reset_test_database
  Dir.chdir("spec/decidim_dummy_app") do
    sh "bundle exec rails db:drop DISABLE_DATABASE_ENVIRONMENT_CHECK=1"
    sh "bundle exec rails db:create"
    sh "bundle exec rails db:migrate"
  end
end

desc "Prepare for testing"
task :prepare_tests do
  disable_docker_compose = ENV.fetch("DISABLED_DOCKER_COMPOSE", "false") == "true"
  unless disable_docker_compose
    sh "docker compose -f docker-compose.yml down -v --remove-orphans"
    sh "docker compose -f docker-compose.yml up -d"
  end

  with_test_database_env do
    write_test_database_yml
    reset_test_database
  end
end

desc "Generates a dummy app for testing"
task :test_app do
  Bundler.with_original_env do
    generate_decidim_app(
      "spec/decidim_dummy_app",
      "--app_name",
      "#{base_app_name}_test_app",
      "--path",
      "../..",
      "--skip_spring",
      "--force_ssl",
      "false",
      "--locales",
      "en,fr,es"
    )
  end
  install_module("spec/decidim_dummy_app")
  Rake::Task["prepare_tests"].invoke
end

desc "Generates a development app"
task :development_app do
  Bundler.with_original_env do
    generate_decidim_app(
      "development_app",
      "--app_name",
      "#{base_app_name}_development_app",
      "--path",
      "..",
      "--recreate_db",
      "--demo"
    )
  end
  install_module("development_app")
end
