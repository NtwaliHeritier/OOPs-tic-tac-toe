#!/usr/bin/env ruby

# # select game option method
# puts 'Welcome to Tic-Tac-Toe game! Please select your option'
# puts '1 - Play'
# puts '2 - Exit'
# option = gets.chomp.to_i
# puts option
# # select option method ends here

# if option == 2
#   puts 'Thank you! See you soon!!'
# elsif option == 1
#   puts 'Welcome!! Your match will start soon..'
#   # will call game start method here
# else
#   puts 'Invalid option. Please enter the correct option.'
#   # will call the game option method
# end

# # call game start method
# 2.times do
#   # On each iteration an instance of class player will be created
#   # The players will be automatically assigned the keys
#   # X for player and O for player2
#   puts 'Enter your name'
#   name = gets.chomp
#   puts name
# end

# # A gameboard will be displayed and players will take turns entering their options
# # method for player turn will be called here, which will return the player name whose turn will be.
# puts 'Enter the position'
# position = gets.chomp
# puts position
# # check the input position is already taken. If taken, display message and take the input again.

# # If the entered position is invalid or out of the range of the array values
# # then message for the same will be displayed
# # The input will be asked again.

# # If not, then save the input and update the position value in the gameboard.

# # So, the gameboard after each move will be updated
# # The gameboard will display the available position with the respective numeric value.

# # with each input, the positions will be saved to a player's moves array

# # after the third input of each player, the program will start comparing the users input with the winning combination

# # if 3 of the player's moves combination matches the winning combination
# puts "That's a winning move"
# # if the gameboard is full and there is no win yet
# puts "That's a draw"

# # These actions will be repeated to all players

# # tie method to check if the match is tie.
# # Replay option method after tie or game win.
# puts 'Want to play again?'
# puts 'Yes'
# puts 'No'

# reply = gets.chomp
# # Start game method call if Yes else exit the game.
# puts reply

class Player
  attr_accessor :name, :key, :array
  def initialize(name, key)
    @name=name
    @key=key
    @array = []
  end
end

class Game
  @@winning_combo = [
    [1,2,3],
    [4,5,6],
    [7,8,9],
    [1,4,7],
    [2,5,8],
    [3,6,9],
    [1,5,9],
    [3,5,7]
    ]
  attr_accessor :player1, :player2, :gameArray
  def initialize
    @player1 = Player.new("","X")
    @player2 =Player.new("", "O")
    @gameArray = [1,2,3,4,5,6,7,8,9]
  end

  def info
    name =""
    puts 'Welcome to Tic-Tac-Toe Game!!'
    loop do
      puts 'Enter your name Player1.'
      name = gets.chomp()
      break if name != "" && name != " "
    end
    @player1.name = name
    puts "#{@player1.name} your key is #{@player1.key}"
    loop do
      puts 'Enter your name Player2.'
      name = gets.chomp()
      break if name != "" && name != " "
    end
    @player2.name = name
    puts "#{@player2.name} your key is #{@player2.key}"
    puts "Here is the game board"
    gameboard()
  end

  def gameboard
    9.times do |i|
      print " #{gameArray[i]} | " if i%3!=2
       puts " #{gameArray[i]} " if i%3 == 2
    end
  end

  def gameStart
    position=0
    i=0
    while i<9 do
      loop do 
        puts 'Player1 please enter the position for your key.'
        position = gets.chomp().to_i
        break if positionCheck(position,@player1.key)
      end
      @player1.array.push(position)
      gameboard
      if check_win?(@@winning_combo, @player1.array)
        return win(@player1.name)
        break
      end
      i+=1
      break if i >=9
      loop do 
        puts 'Player2 please enter the position for your key.'
        position = gets.chomp().to_i
        break if positionCheck(position,@player2.key)
      end
      @player2.array.push(position)
      gameboard
      if check_win?(@@winning_combo, @player2.array)
        return win(@player2.name)
        break
      end
      i+=1
      break if i >=9
    end
    puts tie
  end

  def check_win?(y, t)
    y.length.times do |item|
        return true if y[item].all?{|x| t.include?(x)}
    end
    return false
  end

  def win(p)
    puts "#{p} won"
  end

  def tie
    return "tie"
  end

  def positionCheck(pos, key)
    case pos
    when 1..9
      if @gameArray[pos-1].is_a?(Integer)
        @gameArray[pos-1] = key
        return true
      else
        puts "Position already taken. Please choose different position."
        return false
      end
    else
      puts "Invalid position. Please choose again."
      return false
    end
  end
  
end

game = Game.new()
game.info
game.gameStart


