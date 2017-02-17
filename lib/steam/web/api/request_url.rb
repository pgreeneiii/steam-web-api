# frozen_string_literal: true
module Steam
  module Web
    module Api
      class RequestUrl
        DEFAULT_VERSION = 'v0002'

        attr_reader :interface, :method, :params, :version

        def initialize(interface, method, params, version)
          @interface = interface
          @method = method
          @params = params
          @version = version
        end

        def to_s
          "#{url}?#{RequestParams.new(params).query_string}"
        end

        private

        def url
          [base, interface, method, version].join('/')
        end

        def version
          @version || DEFAULT_VERSION
        end

        def base
          'http://api.steampowered.com'
        end
      end
    end
  end
end
