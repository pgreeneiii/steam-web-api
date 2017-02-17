# frozen_string_literal: true
module Steam
  module Web
    module Api
      class VanityUrl
        def initialize(url)
          @vanity = url
        end

        def url
          if url?
            @vanity.split('/').last
          else
            @vanity
          end
        end

        private

        def url?
          @vanity.include?('steamcommunity')
        end
      end
    end
  end
end
