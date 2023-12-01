module RobotSim
  # the robot knows its position (0,0) using #coordinates, and direction (NESW) using 
  # #current_direction.
  #
  # can rotate 90deg #left or #right, and #move in the direction it is facing.
  #
  # #place is the equivalent of picking up the robot and putting it down in a 
  # different spot
  class Robot
    def initialize(x: nil, y: nil, direction_index: 0)
      @x = x
      @y = y
      @direction_index = direction_index
    end

    def current_direction
      DIRECTIONS.keys[@direction_index]
    end

    def left
      rotate(:-)
    end

    def right
      rotate(:+)
    end

    def place(direction_index:, x: nil, y: nil)
      @x = x || @x
      @y = y || @y
      @direction_index = direction_index
    end

    def move
      vector = DIRECTIONS[current_direction][:vector]
      increment = instance_variable_get("@#{vector}").send(DIRECTIONS[current_direction][:operand], 1)
      movement = { vector => increment }

      yield(coordinates.merge(movement)) && place(**movement, direction_index: @direction_index)
    end

    def coordinates
      { x: @x, y: @y }
    end

    private

    def rotate(offset)
      @direction_index = @direction_index.send(offset, 1) % DIRECTIONS.keys.length
    end
  end
end
