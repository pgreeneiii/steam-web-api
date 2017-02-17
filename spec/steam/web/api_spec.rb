# frozen_string_literal: true
require 'spec_helper'

describe Steam::Web::Api do
  it 'has a version number' do
    expect(Steam::Web::Api::VERSION).not_to be nil
  end
end
