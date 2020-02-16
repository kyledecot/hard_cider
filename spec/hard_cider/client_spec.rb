# frozen_string_literal: true

RSpec.describe HardCider::Client do
  let(:client) { described_class.new }
  let(:bundle_id) { 'com.kyledecot.Example' }

  describe '#latest_build' do
    it 'returns a hash' do
      actual = client.latest_build(nil)
      expect(actual).to be_a(Hash)
    end
  end
end
