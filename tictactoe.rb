# Tic Tac Toe from Odin Project - http://www.theodinproject.com/ruby-programming/oop
# Create a tic tac toe game from the command line
# Object oriented programming section


# The cell class.
class Cell
  attr_accessor :value
  def initialize(value = "")
    @value = value
  end
end




# The player class.
class Player
  attr_accessor :color, :name
  def initialize(input)
    @color = input.fetch(:color)
    @name = input.fetch(:name)
  end
end




# The board class.
class Board
  def initialize(input)
    @grid = input.fetch(:grid)
  end

  def get_cell(x, y)
    grid[y][x]
  end

  def set_cell(x, y, value)
    get_cell(x, y).value = value
  end

  def game_over
    return :winner if winner?
    return :draw if draw?
    false
  end

  private

  def default_grid
    Array.new(3) { Array.new(3) { Cell.new } }
end




# The array class.
class Array 
  def all_empty?
    self.all? { |element| element.to_s.empty? }
  end

  def all_same?
    self.all? { |element| element == self[0] }
  end

  def any_empty?
    self.any? { |element| element.to_s.empty? }
  end

  def none_empty?
    !any_empty?
  end
end