# frozen_string_literal: true
module Steam
  module Web
    module Api
      class Request
        # Instantiate a request object
        #
        # @param url [RequestUrl] the request url object
        def initialize(url)
          @url = url
        end

        def url
          @url.to_s
        end

        def host
          uri.host
        end

        private

        def uri
          URI(url)
        end
      end
    end
  end
end
