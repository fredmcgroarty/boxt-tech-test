require 'spec_helper'

describe RobotSim::Controller do
  describe 'instance_methods' do
    describe '#run' do
      let(:robot_controller) { described_class.new(instructions: instructions) }

      context 'when robot is placed and moves north' do
        let(:instructions) do
          [
            RobotSim::Instructions::Instruction.new(command: 'PLACE', x: 0, y: 0, direction: 'NORTH'),
            RobotSim::Instructions::Instruction.new(command: 'MOVE'),
            RobotSim::Instructions::Instruction.new(command: 'REPORT')
          ]
        end

        it 'reports the new position correctly' do
          expect(robot_controller.run).to eq('Output: 0,1,NORTH')
        end
      end

      context 'when robot is placed and rotates left' do
        let(:instructions) do
          [
            RobotSim::Instructions::Instruction.new(command: 'PLACE', x: 0, y: 0, direction: 'NORTH'),
            RobotSim::Instructions::Instruction.new(command: 'LEFT'),
            RobotSim::Instructions::Instruction.new(command: 'REPORT')
          ]
        end

        it 'reports the new direction correctly' do
          expect(robot_controller.run).to eq('Output: 0,0,WEST')
        end
      end

      context 'when robot follows a complex set of instructions' do
        let(:instructions) do
          [
            RobotSim::Instructions::Instruction.new(command: 'PLACE', x: 1, y: 2, direction: 'EAST'),
            RobotSim::Instructions::Instruction.new(command: 'MOVE'),
            RobotSim::Instructions::Instruction.new(command: 'MOVE'),
            RobotSim::Instructions::Instruction.new(command: 'LEFT'),
            RobotSim::Instructions::Instruction.new(command: 'MOVE'),
            RobotSim::Instructions::Instruction.new(command: 'REPORT')
          ]
        end

        it 'reports the correct position and direction' do
          expect(robot_controller.run).to eq('Output: 3,3,NORTH')
        end
      end
    end
  end
end

