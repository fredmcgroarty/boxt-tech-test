# frozen_string_literal: true

module RobotSim
  # Provides a list of instructions for sequencing in the controller 
  # extends Enumerable to allow for iteration over the list of instructions 
  # Adds an Instruction object to read the command, coordinates and direction e.g.
  # Instructions::Instruction.new(command: Instructions::PLACE, x: 0, y: 0, direction: 'NORTH')
  class Instructions
    PLACE = 'PLACE'
    REPORT = 'REPORT'
    MOVE = 'MOVE'
    LEFT = 'LEFT'
    RIGHT = 'RIGHT'
    COMMANDS = [PLACE, MOVE, LEFT, RIGHT, REPORT].freeze

    include Enumerable

    Instruction = Struct.new(:command, :x, :y, :direction, keyword_init: true)

    def self.default
      new([
        Instruction.new(command: PLACE, x: 0, y: 0, direction: 'NORTH'),
        Instruction.new(command: MOVE),
        Instruction.new(command: REPORT)
      ])
    end

    def initialize(list)
      @list = list
    end

    def each(&block)
      @list.each(&block)
    end
  end
end
