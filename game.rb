class Game
  attr_reader :name, :players, :scores, :round, 
  :turn_score, :winner, :done_playing
  def initialize
    @name = nil
    @players =[]
    @scores = {}
    @round = 0
    @turn_score = 0
    @won = false
    @winner = ""
    @max =20
    @done_playing = false
  end

  def get_players
    puts "How many players?"
    number_of_players = gets.chomp.to_i
    count = 1
    number_of_players.times do
      puts "Enter name for player #{count}: "
      p = gets.chomp
      @players.push p
      @scores[p] = 0
      count += 1
      puts
    end
  end

  def update_score 
    @scores[turn?] += @turn_score
    if @scores[turn?] >= @max
      @won = true
      @winner = turn?
    end
  end

  def turn?
    n =@round % players.count
    @players[n]
  end

  def change_turn
    @round += 1
    @turn_score =0
    puts "-" * 50
  end

  def won?
    @won
  end

  def play_again?
    puts "Play again? y/n"
    if gets.chomp =="n"
      @done_playing = true
    end
    system "clear"
  end

  def pick_game
    puts "Pick a game to play:"
    puts "1) Pig"
    puts "2) Hog"
    choice = if gets.chomp.to_i == 1
      Pig
    else
      Hog
    end
    choice.new
  end

end

class Hog < Game
  attr_reader :dice
  def initialize *players
    super
    @name = "Hog"
    @dice = nil
    @players = *players
    @last_roll =0
    puts "Welcome to Hog."
  end

  def how_many_dice n 
    @dice = n
  end

  def roll 
    @turn_score = 0
    @dice.times do
      value = rand(1..6)
      if value == 1
        @turn_score = 0
        puts "You rolled a one!"
        return 
      else
        @turn_score += value
      end
    end
  end
end