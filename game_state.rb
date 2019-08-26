class GameState
  attr_reader :board, :turn

  def initialize(board = nil, turn = 'X')
    @board = board || Array.new(9, ' ')
    @turn = turn
    @movelist = []
  end

  def move(index)
    @board[index] = @turn
    @turn = other_turn
    @movelist << index
    self
  end

  def unmove
    @board[@movelist.pop] = ' '
    @turn = other_turn
    self
  end

  def other_turn
    @turn == 'X' ? 'O' : 'X'
  end

  def possible_moves
    @board.map.with_index { |piece, index| piece == ' ' ? index : nil }.compact
  end

  def winning_positions
    [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6]
    ]
  end

  def winning_lines
    winning_positions.map do |line|
      line.map { |line_index| @board[line_index] }
    end
  end

  def win?(piece)
    winning_lines.any? do |line|
      line.all? { |line_piece| line_piece == piece }
    end
  end

  def tied?
    winning_lines.all? do |line|
      line.any? { |line_piece| line_piece == 'X' } &&
        line.any? { |line_piece| line_piece == 'O' }
    end
  end

  def first_move?
    movelist.empty?
  end

  def game_over?
    win?('X') || win?('O') || @board.count(' ').zero?
  end

  def players_turn?
    @turn == 'O'
  end

  def computers_turn?
    @turn == 'X'
  end

  def set_players_turn
    @turn = 'O'
  end

  def set_computers_turn
    @turn = 'X'
  end

  def space_available?(index)
    @board[index] == ' '
  end

  private

  attr_reader :movelist
end
