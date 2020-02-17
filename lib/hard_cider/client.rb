# frozen_string_literal: true

require 'app_store_connect'

module HardCider
  class Client
    # @param options [Hash]
    def initialize(options = {})
      @client = AppStoreConnect::Client.new(options)
    end

    # @param bundle_id [String]
    # @return [Hash]
    def latest_build(bundle_id)
      response = @client.builds(
        limit: 1,
        filter: {
          app: app_id(bundle_id)
        }
      )

      response.dig(:data, 0)
    end

    # @param bundle_id [String]
    # @return [String]
    def latest_build_processed?(bundle_id)
      processing_state = latest_build(bundle_id).dig(:attributes, :processing_state)

      processing_state == 'VALID'
    end

    private

    # @param bundle_id [String]
    def apps(bundle_id)
      response = @client.apps(
        filter: {
          bundle_id: bundle_id
        }
      )

      response[:data]
    end

    # @param bundle_id [String]
    # @return [Hash]
    def app(bundle_id)
      apps(bundle_id).detect do |data|
        data.dig(:attributes, :bundle_id) == bundle_id
      end
    end

    # @param bundle_id [String]
    # @return [String]
    def app_id(bundle_id)
      @app_id ||= {}
      @app_id[bundle_id] ||= begin
        app(bundle_id)&.[](:id)
      end

      @app_id[bundle_id]
    end
  end
end
