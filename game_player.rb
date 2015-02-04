require './game'
g=Game.new
until g.done_playing
  game =g.pick_game
  puts
  game.get_players

  count = 1
  game.players.each do |player|
    puts "Player #{count}: #{player}"
    count += 1
  end
  puts
  until game.won? 
    puts "#{game.turn?}'s turn"
    puts "How many dice do you want to roll? "
    game.how_many_dice gets.chomp.to_i
    puts
    puts "Rolling #{game.dice} dice"
    game.roll
    sleep 0.5
    puts
    game.update_score
    puts "You got #{game.turn_score}, your total is now: #{game.scores[game.turn?]}"
    game.change_turn
    sleep 0.5
    puts
  end
  puts "Game Over. #{game.winner} wins!"
  puts "Final scores: "
  game.scores.each { |p, s| puts "#{p}: #{s}"}
  g.play_again?
end



