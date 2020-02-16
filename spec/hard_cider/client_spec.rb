# frozen_string_literal: true

RSpec.describe HardCider::Client do
  let(:client) { described_class.new }
  let(:bundle_id) { 'com.kyledecot.Example' }

  describe '#latest_build' do
    xit 'returns a hash' do
      actual = client.latest_build
      expect(actual).to match_array([])
    end
  end
end
