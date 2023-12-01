# frozen_string_literal: true

require 'rspec'

describe RobotSim::Instructions do
  describe 'constants' do
    describe 'COMMANDS' do
      subject { described_class::COMMANDS }
      it { is_expected.to include(described_class::PLACE) }
      it { is_expected.to include(described_class::MOVE) }
      it { is_expected.to include(described_class::LEFT) }
      it { is_expected.to include(described_class::RIGHT) }
      it { is_expected.to include(described_class::REPORT) }
    end
  end
  describe 'instance_methods' do
    describe '#each' do
      subject { described_class.new([]).each }
      it { is_expected.to be_an(Enumerator) }
    end
  end
end
