# frozen_string_literal: true
module Steam
  module Web
    module Api
      # Handles http concerns for the steam api.
      class Client
        attr_reader :interface

        def initialize(interface)
          @interface = interface
        end

        def get(method, params = {}, version = nil)
          url = RequestUrl.new(interface, method, params, version)
          request = Request.new(url)
          http = Connection.new
          resp = http.get(request)
          Response.new(resp)
        end
      end
    end
  end
end
