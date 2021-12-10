
#Constantant reprisentng the moves until the board is full
BOARD_SIZE = 9

# Also will need a constant to store our winning combination
WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [6, 4, 2],
  [0, 4, 8],
]

# global variable for our board to be filled with X and O
$board = []

# Print the grid one function
def display_board
  puts " #{$board[0]} | #{$board[1]} | #{$board[2]} "
  puts " ----------- "
  puts " #{$board[3]} | #{$board[4]} | #{$board[5]} "
  puts " ----------- "
  puts " #{$board[6]} | #{$board[7]} | #{$board[8]} "
end

def next_player(player)
  #mapping = {
  # 'X' => 'O',
  #'O' => 'X',
  #}

  #mapping[player]

  case
  when player == "X"
    return player = "O"
  when player == "O"
    return player = "X"
  end
end

# read the player move and return the matching index in the board
def read_move
  gets.chomp.to_i - 1
end

# executes a move
def move(player, index)
  $board[index] = player
end

#check if position is taken
def position_taken?(input)
  $board[input] == "X" || $board[input] == "O"
end

# check if some player has won
def won?
  WIN_COMBINATIONS.each do |combo|
    combo.all? do |x|
    x==player
    
   
    end
  
  end
end

# def won?
# (0.8).each_cons(3) do |combination|
# end

# Checikng for out of bound move is mede
def valid_move?(input)
  input.between?(0, 8) && !position_taken?(input)
end

# check if board if full
def board_full?
  $board.count("X") + $board.count("O") == BOARD_SIZE
end

#player 1 his move and validation
def player1
  current_player = "X"
  a = gets.chomp.to_i - 1

  if valid_move?(a)
    move(current_player, a)

    display_board
  else
    player1
  end
end

#player 2 his move and validation
def player2
  current_player = "X"
  a = gets.chomp.to_i - 1

  if valid_move?(a)
    move(next_player(current_player), a)

    display_board
  else
    player2
  end
end

# function for staring the game
def running_the_game
  loop do
    player1

    if won?
      player = $board[won?.first]

      puts "congrats #{player} you won "

      break
    elsif board_full? && !won?
      puts "Cat's game"
    end
    player2
  end
end

#running_the_game
