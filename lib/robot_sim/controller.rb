module RobotSim
  # Runs robot the simulation. Accepts the following arguments:
  # * instructions: an instance of Instructions or an array of Instruction
  #                 objects
  # * robot:        a RobotSim::Robot object, it must respond to #place, #move,
  #                 #left, #right, #x_y, #current_direction
  # * rules:        a RobotSim::Ruleset object, decides whether the robot can
  #                 move or not with #valid? which also accepts a block.
  #                 uses the tabletop to determine if the robot is in range
  # * tabletop:     a Matrix object
  class Controller
    def initialize(instructions: Instructions.default,
                   robot: Robot.new,
                   ruleset: nil,
                   tabletop: Matrix.zero(5))
      @instructions = instructions
      @tabletop = tabletop
      @robot = robot
      @ruleset = ruleset || Ruleset.new(tabletop)
    end

    def run
      report = nil
      instructions.each do |instruction|
        case instruction.command
        when Instructions::PLACE
          robot.place(
            x: instruction.x,
            y: instruction.y,
            direction_index: DIRECTIONS.keys.index(instruction.direction.to_sym)
          )
        when Instructions::MOVE
          robot.move { |proposed_coordinates| ruleset.valid?(**proposed_coordinates) }
        when Instructions::LEFT
          robot.left
        when Instructions::RIGHT
          robot.right
        when Instructions::REPORT
          report = "Output: #{[*robot.coordinates.values, robot.current_direction].join(',')}"
        end
      end
      report 
    end

    private

    attr_reader :instructions, :robot, :ruleset, :tabletop
  end
end
