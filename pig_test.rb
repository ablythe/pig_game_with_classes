require 'minitest/autorun'
require './game'

class TestsPigs < MiniTest::Test 

  def test_can_start_game_of_hog
    h = Hog.new "Alex"
    assert_equal h.name, "Hog"
  end

  def test_it_knows_who_is_playing
    h = Hog.new "Alex", "Tom"
    assert_equal h.players, ["Alex", "Tom"]
  end

  def test_it_knows_how_many_dice_to_roll
    h = Hog.new "Alex"
    h.how_many_dice 5
    assert_equal h.dice, 5
  end

  def test_it_knows_how_to_roll
    h = Hog.new "Alex"
    h.how_many_dice 1
    roll = h.roll
    assert roll >0
    assert roll <= 6
  end

  def test_it_knows_the_score
    h = Hog.new "Alex"
    h.how_many_dice 1
    assert h.score == 0
    h.roll
    assert h.score > 0
  end

  def test_it_does_not_score_ones
    h = Hog.new "Alex"
    h.how_many_dice 1
    h.roll 1
    assert_equal h.score, 0
  end

  def test_it_knows_whos_turn_it_is
    h= Hog.new "Alex", "John"
    h.how_many_dice 1
    assert_equal h.turn?, "Alex"
    h.roll
    assert_equal h.turn?, "John"
  end







end