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
        HardCider.wait(Utils.underscore_keys(options))
      end
    end
  end
end
