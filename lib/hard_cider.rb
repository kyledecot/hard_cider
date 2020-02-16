# frozen_string_literal: true

require 'hard_cider/version'
require 'hard_cider/client'
require 'hard_cider/utils'

module HardCider
  CLIENT_OPTIONS = %i[key_id issuer_id private_key].freeze

  def self.wait(options)
    client = HardCider::Client.new(
      options.slice(*CLIENT_OPTIONS)
    )

    i = 0
    loop do
      i += 1

      client.latest_build(nil)
      options[:before_wait]&.call
      sleep(5)

      break if i > 2
    end

    print "\n"

    true
  end
end
