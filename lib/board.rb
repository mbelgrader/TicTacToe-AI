class Board
  attr_accessor :grid

  DEFAULT = Array.new(3) { Array.new(3) {nil} }

  def initialize(grid = DEFAULT)
    @grid = grid
  end

  def [](pos)
    row, col = pos
    grid[row][col]
  end

  def []=(pos, mark)
    row, col = pos
    grid[row][col] = mark
  end

  def place_mark(pos, mark)
    self[pos] = mark
  end

  def empty?(pos)
    self[pos].nil?
  end

  def over?
    winner || grid.flatten.count(nil) == 0
  end

  def winner
    [:X, :O].each do |mark|
      return mark if row_match(mark) || col_match(mark) || diag_match(mark)
    end
    nil
  end

  def row_match(mark)
    grid.each {|row| return true if row.count(mark) == 3}
    false
  end

  def col_match(mark)
    (0..2).each do |i|
      return true if grid.map { |r| r[i] }.count(mark) == 3
    end
    false
  end

  def diag_match(mark)
    down_diag = [[0,0], [1,1], [2,2]]
    up_diag = [[0,2], [1,1], [2,0]]
    return true if down_diag.map { |pos| self[pos] }.count(mark) == 3
    return true if up_diag.map { |pos| self[pos] }.count(mark) == 3
    false
  end


end
