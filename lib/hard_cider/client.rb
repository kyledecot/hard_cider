# frozen_string_literal: true

require 'app_store_connect'

module HardCider
  class Client
    def initialize(options = {})
      @client = AppStoreConnect::Client.new(options)
    end

    def latest_build(_bundle_id)
      response = @client.builds(
        limit: 1
        # filter: {
        # app: bundle_id
        # }
      )

      response[:data].first
    end
  end
end
