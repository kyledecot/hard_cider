# frozen_string_literal: true

RSpec.describe HardCider::CLI do
  before do
    stub_request(:get, %r{api\.appstoreconnect\.apple\.com/v1/apps}).to_return(body: fixture('apps.json'))
    stub_request(:get, %r{api\.appstoreconnect\.apple\.com/v1/builds}).to_return(body: fixture('valid.json'))
  end

  describe '.run' do
    context 'when command is `wait`' do
      it 'should delegate' do
        expect(HardCider)
          .to receive(:wait)
          .and_call_original

        described_class.run(['wait', '--frequency', '0', '--timeout', '0', '--bundle-id', 'com.kyledecot.Example'])
      end
    end
  end
end
