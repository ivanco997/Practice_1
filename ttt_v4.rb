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
  when player == :X
    :O
  when player == :O
    :X
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
  $board[input] == :X || $board[input] == :O
end

# check if some player has won
def won?
  WIN_COMBINATIONS.each do |combo|
    combo.each_cons(3) do |x, y, z|
      if $board[x] == :X && $board[y] == :X && $board[z] == :X
        return :X
      elsif $board[x] == :O && $board[y] == :O && $board[z] == :O
        return :O
      end
    end
  end
  false
end



# Checikng for out of bound move is mede
def valid_move?(input)
  input.between?(0, 8) && !position_taken?(input)
end

# check if board if full
def board_full?
  $board.count(:X) + $board.count(:O) == BOARD_SIZE
end



# winner functiom
def winner?
  puts == :X
end


# function for staring the game
def running_the_game
  current_player = :O

  loop do
    a = gets.chomp.to_i - 1

    if valid_move?(a)
      move(current_player, a)

      display_board
    end

    if won?
      puts "Congrats #{current_player} won"

      break

       elsif  board_full?
         puts "Cats game"
       break
    end

    current_player = next_player(current_player)
  end
end

running_the_game
