class TicTacToe
  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

  def initialize
    @board = Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} \n"
    puts "-----------\n"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} \n"
    puts "-----------\n"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} \n"
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(move, character)
    @board[move] = character
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(position)
    !position_taken?(position) && position >= 0 and position <= 8
  end

  def turn_count()
    total = 0
    total += @board.count("X")
    total += @board.count("O")
  end

  def current_player()
    turn_count(@board).even? ? "X" : "O"
  end
end
