# frozen_string_literal: true
require 'spec_helper'

module Steam
  module Web
    module Api
      describe VanityUrl do
        it 'supports a full url' do
          vanity = VanityUrl.new('http://steamcommunity.com/id/_biggy')
          expect(vanity.url).to eq('_biggy')

          vanity = VanityUrl.new('https://steamcommunity.com/id/_biggy')
          expect(vanity.url).to eq('_biggy')

          vanity = VanityUrl.new('www.steamcommunity.com/id/_biggy')
          expect(vanity.url).to eq('_biggy')

          vanity = VanityUrl.new('steamcommunity.com/id/_biggy')
          expect(vanity.url).to eq('_biggy')
        end

        it 'supports just a name' do
          vanity = VanityUrl.new('_biggy')

          expect(vanity.url).to eq('_biggy')
        end
      end
    end
  end
end
