require 'simplecov'

SimpleCov.start

require 'minitest/autorun'
require './game'

class TestsPigs < MiniTest::Test 

  def test_can_start_game_of_hog
    h = Hog.new 
    assert_equal h.name, "Hog"
  end

  def test_it_knows_who_is_playing
    h = Hog.new 
    h.test_players "Alex", "Tom"
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
    assert roll > 0
    assert roll <= 6
  end

  def test_it_knows_the_score
    h = Hog.new 
    h.turn_score = 6
    h.update_score
    assert h.scores[0] == 6
  end

  def test_it_does_not_score_ones
    h = Hog.new 
    h.players = "Alex"
    h.how_many_dice 1
    h.roll
    assert_equal h.scores[h.turn?], 0
  end

  def test_it_knows_whose_turn_it_is
    h= Hog.new 
    h.how_many_dice 1
    assert_equal h.turn?, "Alex"
    h.change_turn
    assert_equal h.turn?, "John"
  end


end