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
      now = Time.now

      client.latest_build(bundle_id)
      options[:before_wait]&.call
      sleep(options[:frequency])

      return false if now > timeout_at
    end

    true
  end
end
