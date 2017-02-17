# Steam::Web::Api

Ruby interface to Valve's Steam web API

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'steam-web-api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install steam-web-api

## Usage

To configure the gem, one must set the `STEAM_API_KEY` environment variable
to the api key issued to you by Valve.

```ruby
steam_user = Steam::Web::Api::User.new
steam_user.friends('76561197998193728')
```

## Running tests

You must specify `STEAM_API_KEY`.

`STEAM_API_KEY=123 rake spec`

## License

MIT
