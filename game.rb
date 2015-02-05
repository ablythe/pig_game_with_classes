class Game
  attr_reader :name, :scores, :round, :players,
  :turn_score, :winner, :done_playing, :turn_score, :number_of_players
  
  def initialize 
    @name = nil
    @players = []
    @scores = {}
    @round = 0
    @turn_score = 0
    @won = false
    @winner = ""
    @max =20
    @done_playing = false
    @turn_over = false
  end

  def test_players *names
    names.each do |player|
      @players.push player
    end
  end

  def how_many_players number
    @number_of_players = number
  end
  
  def add_players player
    @players.push player
    @scores[player] = 0
  end

  def update_score 
    @scores[turn?] += @turn_score
    if @scores[turn?] >= @max
      @won = true
      @winner = turn?
    end
  end

  def turn?
    n =@round % @players.count
    @players[n]
  end

  def turn_over
    @turn_over
  end

  def end_turn
    @turn_over =true
  end

  def change_turn
    @round += 1
    @turn_score =0
    @turn_over =false
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
    choice = nil
    if gets.chomp.to_i == 1
      choice = Pig
    else
      choice =Hog
    end
    choice
  end

end

class Hog < Game
  attr_reader :dice
  def initialize
    super
    @name = "Hog"
  end


  def roll number
    number.times do
      value = rand(1..6)
      if value == 1
        @turn_score = 0
        @turn_over = true
        return true
      else
        @turn_score += value
        
      end
    end
    @turn_over = true
    return false
  end

  def take_turn
    @turn_score = 0
    puts "How many dice do you want to roll? "
    number= gets.chomp.to_i
    puts
    puts "Rolling #{number} dice"
    roll number
  end

end

class Pig < Game
  def initialize 
    super
    @name = "Pig"
  end

  def take_turn
    roll
  end

  def roll
    roll = rand(1..6)
    if roll == 1
      @turn_score = 0
      @turn_over = true
      return true
    end
    @turn_score += roll
    return false
  end


end