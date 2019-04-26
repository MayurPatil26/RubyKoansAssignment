require_relative 'score'
require_relative 'rolls'

def runGame(player_point, nonscored_count)
  temp_score = 0
  if nonscored_count > 0
    puts "You have #{nonscored_count} non scoring dices. want to Roll Again (yes/no):-"
    choice = gets
    if choice.chomp.eql?'yes'
      noscr_points = rolls(nonscored_count)
      temp_score = score(noscr_points)
      puts "Your Current turn score #{temp_score}"
      new_nonscored_count = nonscore(noscr_points)
      if temp_score != 0
        player_point += temp_score
        runGame(player_point, new_nonscored_count)
      else
        player_point = 0
      end
    end
  end
  player_point
end
