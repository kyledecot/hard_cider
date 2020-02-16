# frozen_string_literal: true

require 'hard_cider/version'
require 'hard_cider/client'
require 'hard_cider/utils'

module HardCider
  CLIENT_OPTIONS = %i[key_id issuer_id private_key].freeze
  private_constant :CLIENT_OPTIONS

  def self.wait(bundle_id:, **options)
    client = HardCider::Client.new(
      options.slice(*CLIENT_OPTIONS)
    )

    i = 0
    loop do
      i += 1

      client.latest_build(bundle_id)
      options[:before_wait]&.call
      sleep(5)

      break if i > 2
    end

    true
  end
end
