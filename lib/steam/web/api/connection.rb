# frozen_string_literal: true
module Steam
  module Web
    module Api
      class Connection
        def get(request)
          Net::HTTP.start(request.host, 80) do |http|
            request = Net::HTTP::Get.new(request.url)
            http.request(request)
          end
        end
      end
    end
  end
end
