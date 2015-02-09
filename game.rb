class Game
  attr_reader :name, :scores, :players, :round,
  :turn_score, :winner, :turn_score, :number_of_players
  
  def initialize 
    @name = nil
    @players = []
    @scores = {}
    @turn_score = 0
    @winner = nil
    @max =20
    @round =0
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
      @winner = turn?
    end
  end

  def turn?
    n =@round % @number_of_players
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

  def winner?
    @winner
  end

  def play_again? input
    input =="y" ? true : false
  end

  def pick_game choice
    game = 
    if choice == 1
      Pig
    else
      Hog
    end
    game.new
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