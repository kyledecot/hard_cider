# frozen_string_literal: true

RSpec.describe HardCider do
  before do
    stub_request(:get, %r{api\.appstoreconnect\.apple\.com/v1/apps}).to_return(body: fixture('apps.json'))
    stub_request(:get, %r{api\.appstoreconnect\.apple\.com/v1/builds}).to_return(body: fixture('valid.json'))
  end

  describe '.wait' do
    it 'returns true' do
      actual = described_class.wait(bundle_id: nil, interval: 0, timeout: 1)

      expect(actual).to eq(true)
    end
  end
end
