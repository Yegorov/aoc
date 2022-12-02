# Part 1. Answer: 12535
# Rock     A X
# Paper    B Y
# Scissors C Z
f = File.open('input', 'r')
sum = 0
f.each do |line|
  op, me = line.split(' ').map(&:strip)
  sum += if me == 'X'
      1
    elsif me == 'Y'
      2
    elsif me == 'Z'
      3
    else
      0
    end
  sum += if op == 'A' && me == 'X' ||
            op == 'B' && me == 'Y' ||
            op == 'C' && me == 'Z'
      3
    elsif op == "C" && me == 'X' ||
          op == "A" && me == 'Y' ||
          op == "B" && me == 'Z'
      6
    else
      0
    end
end
f&.close
puts sum


# Part 2. Answer: 15457
# Rock     A
# Paper    B
# Scissors C
# Lose     X
# Draw     Y
# Win      Z
f = File.open('input', 'r')
sum = 0
f.each do |line|
  op, res = line.split(' ').map(&:strip)
  if res == 'X'
    sum += if op == 'A'
        3
      elsif op == 'B'
        1
      elsif op == 'C'
        2
      end
  elsif res == 'Y'
    sum += 3
    sum += if op == 'A'
        1
      elsif op == 'B'
        2
      elsif op == 'C'
        3
      end
  elsif res == 'Z'
    sum += 6
    sum += if op == 'A'
        2
      elsif op == 'B'
        3
      elsif op == 'C'
        1
      end
  end
end
f&.close
puts sum
