# frozen_string_literal: true

module Decidim
  module BetterAccountability
    class BetterAccountabilitiesController < ApplicationController
      def grid
        render text: "hello world"
      end
    end
  end
end
