class Game
    WINNING_COMBO = [
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9],
      [1, 4, 7],
      [2, 5, 8],
      [3, 6, 9],
      [1, 5, 9],
      [3, 5, 7]
    ].freeze
    attr_reader :player1, :player2, :game_array
    def initialize
      @player1 = Player.new('', 'X')
      @player2 = Player.new('', 'O')
      @game_array = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    end
  
    def info
      name = ''
      puts 'Welcome to Tic-Tac-Toe Game!!'
      loop do
        puts 'Player1 enter your name.'
        name = gets.chomp.capitalize
        break if name != '' && name != ' '
      end
      @player1.name = name
      puts "Hi, #{@player1.name} your key for the game is #{@player1.key}"
      loop do
        puts 'Player2 enter your name.'
        name = gets.chomp.capitalize
        break if name != '' && name != ' '
      end
      @player2.name = name
      puts "Hi, #{@player2.name} your key for the game is #{@player2.key}"
      puts 'Here is the game board'
      gameboard
    end
  
    def gameboard
      9.times do |i|
        print " #{game_array[i]} | " if i % 3 != 2
        puts " #{game_array[i]} " if i % 3 == 2
      end
    end
  
    def move(player_name, pos1)
      loop do
        puts "Hi, #{player_name.name} please enter the position for your key."
        pos1 = gets.chomp.to_i
        break if position_check(pos1, player_name.key)
      end
      player_name.array.push(pos1)
    end
  
    def game_start
      position = 0
      i = 0
      while i < 9
        move(@player1, position)
        gameboard
        return win(@player1.name) if check_win?(WINNING_COMBO, @player1.array)
  
        i += 1
        break if i >= 9
  
        move(@player2, position)
        gameboard
        return win(@player2.name) if check_win?(WINNING_COMBO, @player2.array)
  
        i += 1
        break if i >= 9
  
      end
      puts tie
    end
  
    def check_win?(arr1, arr2)
      arr1.length.times do |item|
        return true if arr1[item].all? { |x| arr2.include?(x) }
      end
      false
    end
  
    def win(player)
      puts "Yay..!!#{player} won."
    end
  
    def tie
      "It's draw match!!"
    end
  
    def position_check(pos, key)
      case pos
      when 1..9
        if @game_array[pos - 1].is_a?(Integer)
          @game_array[pos - 1] = key
          true
        else
          puts 'Position already taken. Please choose different position.'
          false
        end
      else
        puts 'Invalid position. Please choose again.'
        false
      end
    end
  end