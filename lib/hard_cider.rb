# frozen_string_literal: true

require 'hard_cider/version'
require 'hard_cider/client'
require 'hard_cider/utils'

module HardCider
  CLIENT_OPTIONS = %i[key_id issuer_id private_key].freeze
  private_constant :CLIENT_OPTIONS

  DEFAULTS = { frequency: 30, timeout: 3600 }.freeze

  def self.wait(bundle_id:, **options)
    options = DEFAULTS.merge(options)
    client = HardCider::Client.new(
      options.slice(*CLIENT_OPTIONS)
    )
    timeout_at = Time.now + options[:timeout]

    loop do
      options[:before_wait]&.call

      return true if client.latest_build_processed?(bundle_id)
      return false if Time.now > timeout_at

      sleep(options[:frequency])
    end
  end
end
