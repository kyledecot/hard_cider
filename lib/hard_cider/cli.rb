# frozen_string_literal: true

require 'hard_cider'
require 'gli'

module HardCider
  class CLI
    extend GLI::App

    command :wait do |c|
      c.flag %i[i issuer-id]
      c.flag %i[k key-id]
      c.flag %i[p private-key]
      c.flag %i[b bundle-id]

      c.action do |_global_options, options, _args|
        client = HardCider::Client.new(client_options(options))

        puts client.latest_build(nil)
      end
    end

    private

    def self.client_options(options)
      options.slice(:key - id, :issuer - id, :private - key).map do |key, value|
        [key.to_s.gsub('-', '_').to_sym, value]
      end.to_h
    end
    private_class_method :client_options
  end
end
