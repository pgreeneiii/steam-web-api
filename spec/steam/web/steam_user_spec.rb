# frozen_string_literal: true
require 'spec_helper'

module Steam
  module Web
    module Api
      describe SteamUser, vcr: true do
        before do
          @steam_id = '76561197998193728'
          @su = SteamUser.new
        end

        describe '#player_summaries' do
          it 'returns a hash keyed by community id' do
            summaries = @su.player_summaries(@steam_id)

            expect(summaries[@steam_id]).to be
            expect(summaries[@steam_id]).to be_a(Hash)
          end

          it 'can look up an array of steam ids' do
            summaries = @su.player_summaries([@steam_id])

            expect(summaries[@steam_id]).to be
            expect(summaries[@steam_id]).to be_a(Hash)
          end

          it 'returns an empty hash if no summary found' do
            summaries = @su.player_summaries('some-fake-id')

            expect(summaries).to eq({})
          end

          it 'does not care if only some steam ids have summaries' do
            summaries = @su.player_summaries([@steam_id, 'some-fake-id'])

            expect(summaries[@steam_id]).to be
            expect(summaries[@steam_id]).to be_a(Hash)
            expect(summaries['some-fake-id']).to eq(nil)
          end
        end

        describe '#friends' do
          it 'returns a list of friends for a single steam id' do
            friends = @su.friends(@steam_id)

            expect(friends).to be_a(Hash)
          end

          it 'returns an empty hash if no friends found' do
            friends = @su.friends('some-fake-id')

            expect(friends).to eq({})
          end
        end

        describe 'bans' do
          it 'returns ban status for a steam id' do
            bans = @su.bans(@steam_id)

            expect(bans[@steam_id]).to eq('CommunityBanned' => false,
                                          'VACBanned' => false,
                                          'NumberOfVACBans' => 0,
                                          'DaysSinceLastBan' => 0,
                                          'NumberOfGameBans' => 0,
                                          'EconomyBan' => 'none')
          end

          it 'returns an empty array if no info for steam id found' do
            bans = @su.bans('some-fake-id')
            expect(bans).to eq({})
          end

          it 'can look up an array of ids' do
            bans = @su.bans([@steam_id])

            expect(bans[@steam_id]).to eq('CommunityBanned' => false,
                                          'VACBanned' => false,
                                          'NumberOfVACBans' => 0,
                                          'DaysSinceLastBan' => 0,
                                          'NumberOfGameBans' => 0,
                                          'EconomyBan' => 'none')
          end

          it 'does not care if only some ids match' do
            bans = @su.bans([@steam_id, 'some-fake-id'])

            expect(bans[@steam_id]).to eq('CommunityBanned' => false,
                                          'VACBanned' => false,
                                          'NumberOfVACBans' => 0,
                                          'DaysSinceLastBan' => 0,
                                          'NumberOfGameBans' => 0,
                                          'EconomyBan' => 'none')
          end
        end

        describe '#resolve_vanity_url' do
          it 'can resolve a vanity name into a steam id' do
            community_id = @su.resolve_vanity_url('_biggy')

            expect(community_id).to eq(@steam_id)
          end

          it 'can resolve a vanity http url into a steam id' do
            community_id = @su.resolve_vanity_url('http://steamcommunity/id/_biggy')
            expect(community_id).to eq(@steam_id)

            community_id = @su.resolve_vanity_url('https://steamcommunity/id/_biggy')
            expect(community_id).to eq(@steam_id)
          end

          it 'can resolve a vanity https url into a steam id' do
            community_id = @su.resolve_vanity_url('https://steamcommunity/id/_biggy')
            expect(community_id).to eq(@steam_id)
          end

          it 'returns nil if it can not be resolved' do
            community_id = @su.resolve_vanity_url('some-fake-name-lol')
            expect(community_id).to eq(nil)
          end
        end
      end
    end
  end
end
