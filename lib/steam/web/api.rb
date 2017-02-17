# frozen_string_literal: true
require 'net/http'

require 'steam/web/api/version'
require 'steam/web/api/configuration'

require 'steam/web/api/connection'
require 'steam/web/api/request'
require 'steam/web/api/request_url'
require 'steam/web/api/request_params'
require 'steam/web/api/response'
require 'steam/web/api/client'

require 'steam/web/api/vanity_url'

require 'steam/web/api/interfaces/steam_user'

module Steam
  module Web
    # Access to Steam's web api
    #
    # @example Using the SteamUser interface
    #   steam_user = Steam::Web::Api::SteamUser.new
    #   steam_user.bans(steam_id)
    module Api
    end
  end
end
