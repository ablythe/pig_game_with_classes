class Game
  attr_reader :name, :players
  def initialize
    @name = nil
    @players =[]
  end


  def get_players
    puts "How many players?"
    number_of_players = gets.chomp.to_i
    count = 1
    number_of_players.times do |player|
      puts "Enter name for player #{count}: "
      p = gets.chomp
      @players.push p
      count += 1
    end
  end

end


class Hog < Game
  attr_reader :dice, :players, :score
  def initialize *players
    @name = "Hog"
    @dice = nil
    @players = *players
    @score = 0
    @last_roll =0
    @round=0
  end

  def how_many_dice n 
    @dice = n
  end

  def roll test=nil
    @dice.times do
      @last_roll = test ||rand(1..6)
      unless @last_roll == 1
        @score += @last_roll
      end
      @round += 1
      @last_roll
    end
  end

  def turn
    @round % @players.count
  end

  def turn?
    @players[turn]
  end


end