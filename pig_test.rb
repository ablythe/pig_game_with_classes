

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
    h.how_many_players 2
    assert_equal h.players, ["Alex", "Tom"]
    assert_equal h.number_of_players, 2

  end

  def test_it_can_add_players
    h = Hog.new
    h.add_players "Alex"
    assert_equal h.players, ["Alex"]
  end

  def test_it_knows_whose_turn_it_is
    h= Hog.new
    h.add_players "Alex"
    assert_equal h.turn?, "Alex"
  end


  def test_it_knows_how_to_roll
    h = Hog.new 
    h.roll 1
    assert h.turn_score >= 0
    assert h.turn_score <= 6
    
    p = Pig.new
    p.take_turn
    assert h.turn_score >= 0
    assert h.turn_score <= 6
  end

  def test_it_knows_the_score
    h = Hog.new 
    h.add_players "Alex"
    assert h.scores["Alex"] == 0
  end

  def test_it_knows_whose_turn_it_is
    h= Hog.new 
    h.add_players "Alex"
    h.add_players "John"
    assert_equal h.turn?, "Alex"
    refute h.turn_over
    h.end_turn
    assert h.turn_over
    h.change_turn
    assert_equal h.turn?, "John"
  end

  def test_can_pick_game
    g= Game.new
    p = g.pick_game 1
    assert_equal p.name, "Pig"
    h = g.pick_game 2
    assert_equal h.name, "Hog"
  end

  def test_it_lets_you_play_again
    g =Game.new
    yes = g.play_again? 'y'
    assert_equal yes, true
    no = g.play_again? 'n'
    assert_equal no, false
  end

  def test_it_knows_if_winner
    h =Hog.new
    h.add_players "Alex"
    refute h.winner?
    h.test_score 22
    h.update_score
    assert h.winner?
  end

end