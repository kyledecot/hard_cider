# frozen_string_literal: true

RSpec.describe HardCider::CLI do
  describe '.run' do
    around do |example|
      stdout = $stdout
      $stdout = StringIO.new

      example.call

      $stdout = stdout
    end

    context 'when command is `wait' do
      it 'delegates' do
        expect(HardCider)
          .to receive(:wait)
          .and_call_original

        described_class.run(['wait'])
      end
    end
  end
end
