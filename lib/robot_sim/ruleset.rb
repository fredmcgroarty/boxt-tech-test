module RobotSim
  # Query interface for verifying the robots moves
  class Ruleset
    def initialize(tabletop)
      @tabletop = tabletop
    end

    def valid?(x: nil, y: nil)
      ![x, y].include?(nil) && in_range?(x, y) && (block_given? ? yield : true)
    end

    private

    def in_range?(x, y)
      x.between?(0, tabletop.row_count) && y.between?(0, tabletop.column_count)
    end

    attr_reader :tabletop
  end
end
