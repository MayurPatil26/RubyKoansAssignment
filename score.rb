def full_score(dice)
  total = 0
  non_scoring_dice = dice.size
  dice.uniq.each do |num|
    num_count = dice.count(num)
    if [1, 5].include? num
      scoring_scale = num == 1 ? 100 : 50
      if num_count >= 3
        total += scoring_scale * 10
        total += scoring_scale * (num_count - 3)
      else
        total += scoring_scale * num_count
      end
      non_scoring_dice -= num_count
    else
      if num_count >= 3
        total += num * 100
        non_scoring_dice -= num_count
      end

    end
  end
  [total.to_i, non_scoring_dice]
end

def score(dice)
  full_score(dice)[0]
end

def nonscore(dice)
  full_score(dice)[1]
end
