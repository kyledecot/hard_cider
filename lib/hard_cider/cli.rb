# frozen_string_literal: true

require 'hard_cider'
require 'gli'

module HardCider
  class CLI
    extend GLI::App

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

      c.flag %i[p private-key],
             desc: 'App Store Connect API Private Key',
             mask: true,
             default_value: ENV['APP_STORE_CONNECT_PRIVATE_KEY']

      c.flag %i[b bundle-id],
             required: true

      c.action do |_global_options, options, _args|
        defaults = { before_wait: -> { print '.' } }
        HardCider.wait(Utils.underscore_keys(options).merge(defaults))

        print "\n"
      end
    end
  end
end
