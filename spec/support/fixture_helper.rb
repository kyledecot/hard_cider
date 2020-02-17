# frozen_string_literal: true

module FixtureHelper
  # @param filename [String]
  # @return [String]
  def fixture(filename)
    File.read(File.expand_path("fixtures/#{filename}", __dir__))
  end
end
