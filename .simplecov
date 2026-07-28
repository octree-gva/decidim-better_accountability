# frozen_string_literal: true

SimpleCov.start "rails" do
  root File.expand_path(__dir__)

  add_filter "/spec/"
  add_filter "/decidim_dummy_app/"
  add_filter "/vendor/"
  add_filter "/.bundle/"
  add_filter "/lib/tasks/"
  add_filter %r{/lib/decidim/better_accountability/version\.rb\z}
  add_filter %r{/lib/decidim/better_accountability/admin_engine\.rb\z}
  add_filter %r{/app/controllers/decidim/better_accountability/}

  add_group "App", "app"
  add_group "Lib", "lib"

  enable_coverage :branch

  minimum_coverage line: 85
end
