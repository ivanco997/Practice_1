#Hangman game:
#You are pormp at the begining the enter the word that will be guessed.
#After your're trying to gues each letter form the word you have 7 lives i you make a mistake.
#Game end's with you guessing right the word or running out of lives.
#enjoy

#defininhg the varialable board,lives,word teaser and word
$word = gets.chomp
$lives = 7
$word_teaser = ""
$word.size.times do
  $word_teaser += "_ "
end

#diplaying our guess for the word

def print_teaser(last_guess = nil)
  update_teaser(last_guess) unless last_guess.nil?
  puts $word_teaser
end

#
def update_teaser(last_guess)
  new_teaser = $word_teaser

  new_teaser.chars.each_with_index do |letter, index|
    # replace blank values with guessed letter if matches letter in word
    if letter == "_" && $word[index] == last_guess
      new_teaser[index] = last_guess
    end
  end

  $word_teaser = new_teaser
end

#function for machanic of our game
def make_guess
  loop do
  if $lives > 0

    puts "Enter a letter"
    guess = gets.chomp

    good_guess = $word.include?(guess)

    #If guess is longer than 1 letter
    if guess.length > 1
      puts "only guess 1 letter at a time please!"
      
    elsif good_guess #Condition if we gues correcly the word.
      puts "You are correct!"

      print_teaser(guess)

      if $word == $word_teaser
        puts "Congratulations... you have won!"
        break
    
      end
    else
      #Cheking how many ives we have left
      $lives -= 1
      puts "Sorry... you have #{$lives} lives left. Try again!"
      
    end
  else
    puts "Game over... better luck next time!"
    break
  end
end
end

# Function for staring the game
def play
  puts "New game started... your word is #{$word.size} characters long"
  print_teaser
  make_guess
end

play
