# frozen_string_literal: true

require 'matrix'

Dir[File.join(__dir__, 'robot_sim/**/*.rb')].each { |file| require file }

module RobotSim
  DIRECTIONS = {
    'NORTH': { vector: :y, operand: :+ },
    'EAST': { vector: :x, operand: :+ },
    'SOUTH': { vector: :y, operand: :- },
    'WEST': { vector: :x, operand: :- }
  }.freeze
end
