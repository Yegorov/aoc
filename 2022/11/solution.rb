# Part 1. Answer: 57348
f = File.open('input', 'r')
ms = []

f.each do |line|
  if line =~ /\AMonkey /i
    id = line.scan(/\d+/).first.to_i
    m = {
      id: id,
      items: [],
      op: nil,
      test: nil,
      true: nil,
      false: nil,
      count: 0
    }
    ms << m
  elsif line.chomp != nil
    m = ms[-1]
    if line =~ /Starting items:/i
      m[:items] = line.scan(/\d+/).map(&:to_i)
    elsif line =~ /Operation:/i
      exp = line.scan(/Operation: (.*)/).flatten.first
      m[:op] = proc { |exp| proc { |old| eval(exp) } }.call(exp)
    elsif line =~ /Test:/i
      arg = line.scan(/\d+/).first.to_i
      m[:test] = proc { |arg| proc { |x| x % arg == 0 } }.call(arg)
    elsif line =~ /If true:/i
      id = line.scan(/\d+/).first.to_i
      m[:true] = id
    elsif line =~ /If false:/i
      id = line.scan(/\d+/).first.to_i
      m[:false] = id
    end
  end
end
f&.close

# ms.each do |m|
#   puts "Monkey #{m[:id]}: #{m[:items].join(', ')}"
# end

rounds = 20
rounds.times do
  ms.each do |m|
    while m[:items].count > 0
      item = m[:items].shift
      item = (m[:op].call(item) / 3.0).to_i
      next_id = m[:test].call(item) ? m[:true] : m[:false]
      ms[next_id][:items] << item
      m[:count] += 1
    end
  end
end

# ms.each do |m|
#   puts "Monkey #{m[:id]}: #{m[:items].join(', ')}, count: #{m[:count]}"
# end

ans = ms.map { |m| m[:count] }.sort.reverse.first(2).reduce(&:*)
puts ans

# Part 2. Answer: 14106266886
# https://github.com/derailed-dash/Advent-of-Code/blob/master/src/AoC_2022/d11_monkey_in_the_middle/monkey.py#L139
f = File.open('input', 'r')
ms = []

f.each do |line|
  if line =~ /\AMonkey /i
    id = line.scan(/\d+/).first.to_i
    m = {
      id: id,
      items: [],
      op: nil,
      test: nil,
      test_arg: nil,
      true: nil,
      false: nil,
      count: 0
    }
    ms << m
  elsif line.chomp != nil
    m = ms[-1]
    if line =~ /Starting items:/i
      m[:items] = line.scan(/\d+/).map(&:to_i)
    elsif line =~ /Operation:/i
      exp = line.scan(/Operation: (.*)/).flatten.first
      m[:op] = proc { |exp| proc { |old| eval(exp) } }.call(exp)
    elsif line =~ /Test:/i
      arg = line.scan(/\d+/).first.to_i
      m[:test_arg] = arg
      m[:test] = proc { |arg| proc { |x| x % arg == 0 } }.call(arg)
    elsif line =~ /If true:/i
      id = line.scan(/\d+/).first.to_i
      m[:true] = id
    elsif line =~ /If false:/i
      id = line.scan(/\d+/).first.to_i
      m[:false] = id
    end
  end
end
f&.close

# ms.each do |m|
#   puts "Monkey #{m[:id]}: #{m[:items].join(', ')}"
# end

lcm = ms.map { |m| m[:test_arg] }.reduce(1, :lcm)
rounds = 10000
rounds.times do
  ms.each do |m|
    while m[:items].count > 0
      item = m[:items].shift
      item = m[:op].call(item) % lcm
      next_id = m[:test].call(item) ? m[:true] : m[:false]
      ms[next_id][:items] << item
      m[:count] += 1
    end
  end
end

# ms.each do |m|
#   puts "Monkey #{m[:id]}: #{m[:items].join(', ')}, count: #{m[:count]}"
# end

ans = ms.map { |m| m[:count] }.sort.reverse.first(2).reduce(&:*)
puts ans
