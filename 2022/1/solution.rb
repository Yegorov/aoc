# Part 1. Answer: 72511
f = File.open('input', 'r')
cur = 1
cur_sum = 0

max = 1
max_sum = 0

f.each do |line|
  if line.strip == ""
    if max_sum < cur_sum
      max_sum = cur_sum
      max = cur
    end
    cur += 1
    cur_sum = 0
  else
    cur_sum += line.to_i
  end
end

puts [max, max_sum]


# Part 2. Answer: 212117
f = File.open('input', 'r')
cur = 1
cur_sum = 0

max = 1
max_sum = 0
ms = [0, 0, 0]

f.each do |line|
  if line.strip == ""
    if max_sum < cur_sum
      max_sum = cur_sum
      max = cur
    end

    mm = ms.min
    if mm < cur_sum
      ms[ms.index(mm)] = cur_sum
    end

    cur += 1
    cur_sum = 0
  else
    cur_sum += line.to_i
  end
end

puts ms.sum
