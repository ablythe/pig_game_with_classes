require './game'
g=Game.new

until g.done_playing
  game =g.pick_game.new
  puts "Welcome to #{game.name}."
  puts
  puts "How many players?"
  game.how_many_players gets.chomp.to_i
  puts
  count = 1
  players =[]
  game.number_of_players.times do
    puts "Enter name for player #{count}: "
    game.add_players gets.chomp
  end

  count = 1
  game.players.each do |player|
    puts "Player #{count}: #{player}"
    count += 1
  end
  puts

  until game.won? 
    puts "#{game.turn?}'s turn"
    until game.turn_over
      sleep 0.5
      got_one = false
      got_one = game.take_turn
      if got_one
        puts "You rolled a 1!."
      end
      puts "Your turn score is #{game.turn_score}." 
      puts
      if game.turn_over == false
        puts "Roll again? y/n"
        input = gets.chomp
        if input == "n"
          game.end_turn
        end
      end
    end

    game.update_score
    puts "You got #{game.turn_score}, your total is now: #{game.scores[game.turn?]}"
    game.change_turn
    puts "-" * 50
    sleep 0.5
    puts
  end

  puts "Game Over. #{game.winner} wins!"
  puts "Final scores: "
  game.scores.each { |p, s| puts "#{p}: #{s}"}
  g.play_again?
end



