# frozen_string_literal: true
module Steam
  module Web
    module Api
      class Response
        def initialize(http_response)
          @response = http_response.dup
        end

        def extract(*keys)
          if code == 200
            parsed_body.dig(*keys.map(&:to_s))
          else
            []
          end
        end

        def parsed_body
          JSON.parse(body)
        rescue JSON::ParserError
          {}
        end

        def body
          @response.body
        end

        def code
          @response.code.to_i
        end
      end
    end
  end
end
