# frozen_string_literal: true

RSpec.describe HardCider::Utils do
  describe '.underscore_keys' do
    it 'returns' do
      expected = { hard_cider: 'utils' }
      actual = described_class.underscore_keys("hard-cider": 'utils')

      expect(actual).to eq(expected)
    end
  end

  describe '.underscore' do
    context 'when string' do
      it { expect(described_class.underscore('hard-cider')).to eq(:hard_cider) }
    end

    context 'when symbol' do
      it { expect(described_class.underscore(:"hard-cider")).to eq(:hard_cider) }
    end
  end
end
