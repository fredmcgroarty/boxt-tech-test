require 'spec_helper'

describe RobotSim::Ruleset do
  let(:tabletop) { double('Tabletop', row_count: 5, column_count: 5) }
  let(:ruleset) { described_class.new(tabletop) }

  describe '#valid?' do
    context 'when coordinates are within range' do
      it 'returns true without a block' do
        expect(ruleset.valid?(x: 3, y: 3)).to be true
      end

      it 'returns the result of the block if given' do
        expect(ruleset.valid?(x: 3, y: 3) { false }).to be false
        expect(ruleset.valid?(x: 3, y: 3) { true }).to be true
      end
    end

    context 'when coordinates are out of range' do
      it 'returns false' do
        expect(ruleset.valid?(x: 6, y: 3)).to be false
        expect(ruleset.valid?(x: 3, y: 6)).to be false
      end
    end

    context 'when coordinates are nil' do
      it 'returns false' do
        expect(ruleset.valid?(x: nil, y: 3)).to be false
        expect(ruleset.valid?(x: 3, y: nil)).to be false
        expect(ruleset.valid?).to be false
      end
    end
  end
end

