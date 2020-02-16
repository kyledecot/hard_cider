# frozen_string_literal: true

require 'hard_cider'
require 'gli'

module HardCider
  class CLI
    extend GLI::App

    command :wait do |c|
      c.action do |_global_options, _options, _args|
        client = HardCider::Client.new

        puts client.latest_build(nil)
      end
    end
  end
end
