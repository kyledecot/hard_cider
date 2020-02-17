# frozen_string_literal: true

module HardCider
  module Utils
    # @param hash [Hash]
    # @return [Hash]
    def self.underscore_keys(hash)
      hash.map { |k, v| [underscore(k), v] }.to_h
    end

    # @param string_or_symbol [String|Symbol]
    # @return [Symbol]
    def self.underscore(string_or_symbol)
      string_or_symbol.to_s.gsub('-', '_').to_sym
    end
  end
end
