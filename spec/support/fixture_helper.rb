# frozen_string_literal: true

module FixtureHelper
  def private_key_path
    File.expand_path('./fixtures/private_key.pem', __dir__)
  end

  # @param filename [String]
  # @return [String]
  def fixture(filename)
    File.read(File.expand_path("fixtures/#{filename}", __dir__))
  end
end
