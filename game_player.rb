require './game'

puts "Welcome to Hog."
h= Hog.new
h.get_players

count = 1
h.players.each do |player|
  puts "Player #{count}: #{player}"
  count += 1
end
puts
puts "#{h.turn?}'s turn"

puts "How many dice do you want to roll? "
h.how_many_dice gets.chomp.to_i

puts "Rolling #{h.dice} dice"
h.roll
h.update_score
puts "You got #{h.turn_score}, your total is now: #{h.scores[h.turn?]}"


