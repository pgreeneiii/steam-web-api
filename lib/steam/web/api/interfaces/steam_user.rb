# frozen_string_literal: true
module Steam
  module Web
    module Api
      # Represents the SteamUser steam api interface.
      class SteamUser
        # Valve's steam user interface name
        INTERFACE = 'ISteamUser'

        def initialize
          @client = Client.new(INTERFACE)
        end

        # Get player summaries.
        #
        # @return [Hash<String, Hash>] hash of player summaries keyed by community id
        def player_summaries(*steam_ids)
          result = @client
                   .get('GetPlayerSummaries', steamids: steam_ids.join(','))
                   .extract(:response, :players)

          result.each_with_object({}) do |player, hsh|
            hsh[player['steamid']] = player
            hsh
          end
        end

        # Get player friends.
        #
        # @return [Hash<String, Hash>] hash of player friends keyed by community id
        def friends(steam_id)
          result = @client
                   .get('GetFriendList', { steamid: steam_id }, 'v0001')
                   .extract(:friendslist, :friends)

          result.each_with_object({}) do |friend, hsh|
            steam_id = friend.delete('steamid')
            hsh[steam_id] = friend
          end
        end

        # Get player bans.
        #
        # @return [Hash<String, Hash>] hash of player bans keyed by community id
        def bans(*steam_ids)
          body = { steamids: steam_ids.join(',') }

          result = @client
                   .get('GetPlayerBans', body, 'v1')
                   .extract(:players)

          result.each_with_object({}) do |player, hsh|
            steam_id = player.delete('SteamId')
            hsh[steam_id] = player
          end
        end

        # Resolve a vanity url to a community id. You may pass in the
        # vanity name or the full communtity profile url.
        #
        # @return [String,nil] the community id if resolved, otherwise nil
        def resolve_vanity_url(vanity)
          body = { vanityurl: VanityUrl.new(vanity).url }

          @client
            .get('ResolveVanityURL', body, 'v0001')
            .extract(:response, :steamid)
        end
      end
    end
  end
end
