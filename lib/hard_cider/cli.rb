# frozen_string_literal: true

require 'hard_cider'
require 'gli'

module HardCider
  class CLI
    extend GLI::App

    class IPANotProcessed < GLI::CustomExit
      def initialize
        super('IPA Not Processed', 1)
      end
    end

    command :state do |c|
      c.flag %i[i issuer-id],
             desc: 'App Store Connect API Issuer ID',
             mask: true,
             default_value: ENV['APP_STORE_CONNECT_ISSUER_ID']

      c.flag %i[k key-id],
             desc: 'App Store Connect API Key ID',
             mask: true,
             default_value: ENV['APP_STORE_CONNECT_KEY_ID']

      c.flag %i[p private-key-path],
             desc: 'App Store Connect API Private Key Path',
             default_value: ENV['APP_STORE_CONNECT_PRIVATE_KEY_PATH']

      c.flag %i[b bundle-id],
             desc: 'Bundle Identifier',
             required: true

      c.flag %i[f frequency],
             desc: 'Frequency in seconds',
             type: Integer,
             default_value: HardCider::DEFAULTS[:frequency]

      c.flag %i[t timeout],
             desc: 'Timeout in seconds',
             type: Integer,
             default_value: HardCider::DEFAULTS[:timeout]
      c.action do |_global_options, options, _args|
        puts HardCider.state(Utils.underscore_keys(options))
      end
    end

    program_desc 'Wait for Apple IPAs'

    desc 'Wait for Apple IPAs'
    command :wait do |c|
      c.flag %i[i issuer-id],
             desc: 'App Store Connect API Issuer ID',
             mask: true,
             default_value: ENV['APP_STORE_CONNECT_ISSUER_ID']

      c.flag %i[k key-id],
             desc: 'App Store Connect API Key ID',
             mask: true,
             default_value: ENV['APP_STORE_CONNECT_KEY_ID']

      c.flag %i[p private-key-path],
             desc: 'App Store Connect API Private Key Path',
             default_value: ENV['APP_STORE_CONNECT_PRIVATE_KEY_PATH']

      c.flag %i[b bundle-id],
             desc: 'Bundle Identifier',
             required: true

      c.flag %i[f frequency],
             desc: 'Frequency in seconds',
             type: Integer,
             default_value: HardCider::DEFAULTS[:frequency]

      c.flag %i[t timeout],
             desc: 'Timeout in seconds',
             type: Integer,
             default_value: HardCider::DEFAULTS[:timeout]

      c.action do |_global_options, options, _args|
        defaults = { before_wait: -> { print '.' } }
        result = HardCider.wait(Utils.underscore_keys(options).merge(defaults).reject { |_k, v| v.nil? })

        print "\n"

        raise IPANotProcessed unless result
      end
    end
  end
end
