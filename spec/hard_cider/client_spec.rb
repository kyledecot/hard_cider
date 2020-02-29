# frozen_string_literal: true

RSpec.describe HardCider::Client do
  let(:client) { described_class.new }
  let(:bundle_id) { 'com.kyledecot.Example' }

  before do
    stub_request(:get, %r{api\.appstoreconnect\.apple\.com/v1/apps}).to_return(body: fixture('apps.json'))
    stub_request(:get, %r{api\.appstoreconnect\.apple\.com/v1/builds}).to_return(body: fixture('valid.json'))
  end

  describe '#latest_build' do
    it 'returns a hash' do
      actual = client.latest_build(bundle_id)
      expect(actual).to be_a(Hash)
    end
  end

  describe '#latest_build_processed?' do
    context 'when processing state is `VALID`' do
      let(:client) { described_class.new }

      it 'should return true' do
        expect(client.latest_build_processed?(bundle_id)).to eq(true)
      end
    end
  end
end
