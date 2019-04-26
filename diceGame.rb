require_relative 'rolls'
require_relative 'score'
require_relative 'runGame'

endgame = false
print ' Enter Count of Players want to play:-'
player_count = gets.chomp.to_i
total_score = Array.new(player_count + 1, 0)
while !endgame
  player_point = Array.new(player_count+1,0)
  player_count.times do |pl|
    player = pl + 1
    if total_score[player].to_i >= 3000
      puts total_score.join(',')
      puts "Player #{player} is Winner "
      endgame = true
      break
    end

    puts "\nPlayer #{player} :- Play your Turn (press enter to roll your dices)"
    points = rolls(5)
    nonscored_count = nonscore(points)
    puts "Player points:- #{points.join(',')}"
    player_point[player] = score(points)
    puts "Player scores :-#{player_point[player]}"
    if total_score[player].zero?
      if player_point[player] >= 300
        player_point[player] = runGame(player_point[player], nonscored_count)
        total_score[player] += total_score[player] + player_point[player]
        puts "Total score array #{total_score.join(',')}"
      end
    else
      player_point[player] = runGame(player_point[player], nonscored_count)
      total_score[player] = total_score[player] + player_point[player]
      puts "Total score array #{total_score.join(',')}"
    end
  end
end
