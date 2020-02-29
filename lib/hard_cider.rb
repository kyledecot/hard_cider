# frozen_string_literal: true

require 'hard_cider/version'
require 'hard_cider/client'
require 'hard_cider/utils'

module HardCider
  CLIENT_OPTIONS = %i[key_id issuer_id private_key_path].freeze
  private_constant :CLIENT_OPTIONS

  DEFAULTS = { frequency: 30, timeout: 3600 }.freeze

  # @param bundle_id [String]
  # @param options [Hash]
  # @return [Boolean]
  def self.wait(bundle_id:, **options)
    timeout_at = Time.now + options[:timeout]
    client = build_client(options)

    loop do
      options[:before_wait]&.call

      return true if client.latest_build_processed?(bundle_id)
      return false if Time.now > timeout_at

      sleep(options[:frequency])
    end
  end

  # @param bundle_id [String]
  # @param options [Hash]
  # @return [String]
  def self.state(bundle_id:, **options)
    build_client(options)
      .latest_build(bundle_id)
      .dig(:attributes, :processing_state)
  end

  def self.build_client(options)
    HardCider::Client.new(
      DEFAULTS.merge(options).slice(*CLIENT_OPTIONS)
    )
  end 
  private_class_method :build_client
end
