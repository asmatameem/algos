require 'pry'
class DeliveryPoint
  attr_accessor :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end
end

class PizzaBot
  attr_reader :deliveries, :grid

  def initialize(grid, deliveries)
    @grid = 5
    @deliveries = build_delivey_points(deliveries)
    print_deliveries
  end

  def build_delivey_points(deliveries)
    deliveries.map do |dp|
      DeliveryPoint.new(dp[0], dp[1])
    end
  end

  def directions
    result = ""
    previous = DeliveryPoint.new(0, 0)
    deliveries.each do |current|
      horizontal_moves =  current.x - previous.x
      result += horizontal_moves > 0 ?  move_east(horizontal_moves) : move_west(horizontal_moves)

      vertical_moves = current.y - previous.y
      result += vertical_moves > 0 ?  move_north(vertical_moves) : move_south(vertical_moves)

      previous = current
      result += deliver
    end
    result
  end

  private

  def deliver
    'D'
  end

  def move_east(count)
    'E' * count
  end

  def move_west(count)
    'W' * count
  end

  def move_north(count)
    'N' * count
  end

  def move_south(count)
    'S' * count
  end

  def print_deliveries
    deliveries.each do |dp|
      puts "[#{dp.x}, #{dp.y}]"
    end
  end
end

puts PizzaBot.new(5, [[1, 3], [4, 4]]).directions