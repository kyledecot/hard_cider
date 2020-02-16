# frozen_string_literal: true

require 'bundler/setup'
require 'hard_cider'
require 'pry'
require 'simplecov'
require 'webmock/rspec'

SimpleCov.start do
  add_filter('/spec/')
end

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.before(:each) do
    stub_request(:post, 'https://api.mixpanel.com/track')
    stub_request(:any, /api.appstoreconnect.apple.com/).to_return(body: '{ "data": [{}] }') # TODO

    AppStoreConnect.config = {
      key_id: "KEY_ID",
      private_key: File.read(File.expand_path("spec/support/fixtures/private_key.pem")),

      issuer_id: "ISSUER_ID"
    }
  end

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
