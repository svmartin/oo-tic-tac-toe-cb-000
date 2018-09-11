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
    turn_count.even? ? "X" : "O"
  end

  def turn()
    puts "Please enter 1-9"
    user_move = gets.strip
    user_move = input_to_index(user_move)
    if valid_move?(user_move)
      move(user_move, current_player())
      display_board()
    else
      turn()
    end
  end

  def won?
    winner_exist = false
    return false if @board.all? { |entry| entry == " "}

    WIN_COMBINATIONS.each do |winner|
      row = [@board[winner[0]], @board[winner[1]], @board[winner[2]]]
      return winner if row.count("X") == 3 || row.count("O") == 3
    end
    winner_exist
  end

  def full?
    @board.count == 9 && @board.include?("X") && !@board.include?(" ")
  end

  def over?
    won? || full? || draw? ? true : false
  end

  def draw?
    return true if !won? && full?
    return false
  end

  def winner
    if won?
      @board[won?[0]]
    else
      return nil
    end
  end
end
