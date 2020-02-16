# frozen_string_literal: true

RSpec.describe HardCider do
  describe '.wait' do
    it 'returns true' do
      actual = described_class.wait(bundle_id: nil)

      expect(actual).to eq(true)
    end
  end
end
