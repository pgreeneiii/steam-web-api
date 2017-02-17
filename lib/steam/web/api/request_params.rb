# frozen_string_literal: true
module Steam
  module Web
    module Api
      class RequestParams
        def initialize(params = {})
          @params = params
        end

        def query_string
          to_hash.each_pair.map { |key, val| "#{key}=#{val}" }.join('&')
        end

        def to_hash
          @params.merge(key: Configuration.new.steam_api_key)
        end
      end
    end
  end
end
