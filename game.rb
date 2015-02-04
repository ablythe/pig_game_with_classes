class Game
  attr_reader :name, :players, :scores, :round, :turn_score
  def initialize
    @name = nil
    @players =[]
    @scores = {}
    @round = 0
    @turn_score = 0
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
  end


  def turn?
    n =@round % players.count
    @players[n]
  end

  def change_turn
    @round += 1
    @turn_score =0
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
  end

  def how_many_dice n 
    @dice = n
  end

  def roll test=nil
    @dice.times do
      @last_roll = test ||rand(1..6)
      unless @last_roll == 1
        @turn_score += @last_roll
      end
      @last_roll
    end
  end
end