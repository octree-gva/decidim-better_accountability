# frozen_string_literal: true

module Decidim
  module BetterAccountability
    class AdminEngine < ::Rails::Engine
      isolate_namespace Decidim::BetterAccountability::Admin
    end
  end
end
