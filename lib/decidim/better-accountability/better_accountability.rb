# frozen_string_literal: true

module Decidim
  module BetterAccountability
    include ActiveSupport::Configurable
    class Error < StandardError; end
  end
end
