# Part 1. Answer: 14920
f = File.open('input', 'r')
s = 1
sum = 0
i = 1
d = { 'noop' => 1, 'addx' => 2 }
f.each do |line|
  next if line.strip == ""
  op, num = line.split(' ')
  num = num.to_i if num
  d[op].times do
    if [20, 60, 100, 140, 180, 220].include?(i)
      sum += s * i
    end
    i += 1
  end
  s += num if op == 'addx'
end
f&.close

puts sum

# Part 2. Answer: BUCACBUZ
# ###..#..#..##...##...##..###..#..#.####.
# #..#.#..#.#..#.#..#.#..#.#..#.#..#....#.
# ###..#..#.#....#..#.#....###..#..#...#..
# #..#.#..#.#....####.#....#..#.#..#..#...
# #..#.#..#.#..#.#..#.#..#.#..#.#..#.#....
# ###...##...##..#..#..##..###...##..####.
f = File.open('input', 'r')
s = 1
j = 0
d = { 'noop' => 1, 'addx' => 2 }
f.each do |line|
  next if line.strip == ""
  op, num = line.split(' ')
  num = num.to_i if num
  d[op].times do
    print "#{(s..(s+2)).include?(j + 1) ? '#' : '.'}"
    j += 1
    if j == 40
      puts
      j = 0
    end
  end
  s += num if op == 'addx'
end
f&.close
