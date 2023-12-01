# frozen_string_literal: true

require 'spec_helper'

describe RobotSim::Robot do
  describe 'instance_methods' do
    describe '#current_direction' do
      subject { described_class.new(direction_index: 0).current_direction }
      it { is_expected.to eq(:NORTH) }
    end

    describe '#left' do
      context 'when robot direction_index is 0' do
        subject { described_class.new(direction_index: 0).left }
        it { is_expected.to eq(3) }
      end
      context 'when robot direction_index is 3' do
        subject { described_class.new(direction_index: 3).left }
        it { is_expected.to eq(2) }
      end
      context 'when robot direction_index is 2' do
        subject { described_class.new(direction_index: 2).left }
        it { is_expected.to eq(1) }
      end
      context 'when robot direction_index is 1' do
        subject { described_class.new(direction_index: 1).left }
        it { is_expected.to eq(0) }
      end
      context 'when robot direction_index is 0' do
        subject { described_class.new(direction_index: 0).left }
        it { is_expected.to eq(3) }
      end
    end
    describe '#right' do
      context 'when robot direction_index is 0' do
        subject { described_class.new(direction_index: 0).right }
        it { is_expected.to eq(1) }
      end
      context 'when robot direction_index is 3' do
        subject { described_class.new(direction_index: 1).right }
        it { is_expected.to eq(2) }
      end
      context 'when robot direction_index is 2' do
        subject { described_class.new(direction_index: 2).right }
        it { is_expected.to eq(3) }
      end
      context 'when robot direction_index is 1' do
        subject { described_class.new(direction_index: 3).right }
        it { is_expected.to eq(0) }
      end
      context 'when robot direction_index is 0' do
        subject { described_class.new(direction_index: 0).right }
        it { is_expected.to eq(1) }
      end
    end
  end
end
