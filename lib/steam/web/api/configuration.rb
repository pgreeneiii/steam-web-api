# frozen_string_literal: true
module Steam
  module Web
    module Api
      # Holds the configuration required to use the web api
      class Configuration
        attr_reader :steam_api_key

        def initialize
          @steam_api_key = ENV['STEAM_API_KEY']
        end
      end
    end
  end
end
