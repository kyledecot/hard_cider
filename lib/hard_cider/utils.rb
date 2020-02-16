# frozen_string_literal: true

module HardCider
  module Utils
    def self.underscore_keys(hash)
      hash.map { |k, v| [underscore(k), v] }.to_h
    end

    def self.underscore(string_or_symbol)
      string_or_symbol.to_s.gsub('-', '_').to_sym
    end
  end
end
