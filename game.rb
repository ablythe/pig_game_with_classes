class Game
  attr_reader :name
  def initialize
    @name = nil
  end
end

class Hog < Game
  attr_reader :dice, :players
  def initialize
    super
    @name = "Hog"
    @dice = nil
    @players =[]
  end

  def how_many_dice n 
    @dice = n
  end

  def who_is_playing *players
    players.each {|player| @players.push player} 
  end

  def roll
    @dice.times {rand(1..6)}
  end

end