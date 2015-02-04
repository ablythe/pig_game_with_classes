require 'minitest/autorun'
require './game'

class TestsPigs < MiniTest::Test 

  def test_can_start_game_of_hog
    h = Hog.new
    assert_equal h.name, "Hog"
  end

  def test_it_knows_who_is_playing
    h = Hog.new
    h.who_is_playing "Alex", "Tom"
    assert_equal h.players, ["Alex", "Tom"]
  end

  def test_it_knows_how_many_dice_to_roll
    h = Hog.new
    h.how_many_dice 5
    assert_equal h.dice, 5
  end

  def test_it_knows_how_to_roll
    h = Hog.new
    h.how_many_dice 1
    roll = h.roll
    assert roll >0
    assert roll <= 6
  end
  # def test_it_knows_the_score
  #   h = Hog.new
  #   h.score = 0
  # end

end