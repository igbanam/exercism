class RobotSimulator
  property x : Int32
  property y : Int32
  property direction : Symbol

  DIRECTIONS = [
    :north,
    :east,
    :south,
    :west
  ]

  MOVES = {
    north: [0, 1],
    south: [0, -1],
    east: [1, 0],
    west: [-1, 0]
  }

  def initialize(@position : Tuple(Int32, Int32), @direction : Symbol)
    @x = @position[0]
    @y = @position[1]
  end

  def move(towards : String)
    towards.chars.each do |t|
      current_face = DIRECTIONS.index! { |d| d == direction }
      case t
      when "R", 'R'
        @direction = DIRECTIONS[(current_face + 1) % 4]
      when "L", 'L'
        @direction = DIRECTIONS[(current_face - 1) % 4]
      when "A", 'A'
        @x += MOVES[@direction][0]
        @y += MOVES[@direction][1]
      end
    end
  end
end
