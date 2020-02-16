# frozen_string_literal: true

require 'hard_cider/version'
require 'hard_cider/client'
require 'hard_cider/utils'

module HardCider
  def self.wait(options)
    client = HardCider::Client.new(client_options(options))

    puts client.latest_build(nil)
  end

  private

  def self.client_options(options)
    options.slice(%w[key_id issuer_id private_key]).map do |key, value|
      [key.to_s.gsub('-', '_').to_sym, value]
    end.to_h
  end
  private_class_method :client_options
end
