# frozen_string_literal: true

module Decidim
  module BetterAccountability
    class << self
      def config = self

      def configure
        yield self
      end
    end
  end
end
