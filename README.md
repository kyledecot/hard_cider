# `hard_cider`
[![Test](https://github.com/kyledecot/hard_cider/workflows/Test/badge.svg)](https://github.com/kyledecot/hard_cider/actions) [![Gem Version](https://badge.fury.io/rb/hard_cider.svg)](https://badge.fury.io/rb/hard_cider) [![Maintainability](https://api.codeclimate.com/v1/badges/e13c94f97898e74f34a9/maintainability)](https://codeclimate.com/github/kyledecot/hard_cider/maintainability) [![Test Coverage](https://api.codeclimate.com/v1/badges/e13c94f97898e74f34a9/test_coverage)](https://codeclimate.com/github/kyledecot/hard_cider/test_coverage)

Wait for your Apple .ipa files to be processed

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'hard_cider'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hard_cider

## Usage

```
hard-cider wait \
  --bundle-id="com.kyledecot.Example" \
  --key-id=$APP_STORE_CONNECT_KEY_ID \
  --private-key-path="$(cat PRIVATE_KEY)" \
  --issuer-id=$APP_STORE_CONNECT_ISSUER_ID
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kyledecot/hard_cider.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
