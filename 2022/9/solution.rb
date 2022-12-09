# Part 1. Answer: 6494
# Part 2. Answer: 6494
# Solution from https://github.com/mebeim/aoc/blob/master/2022/solutions/day09.py
def sign(x)
  x > 0 ? 1 : (x < 0 ? -1 : 0)
end

f = File.open('input', 'r')
delta = { 'U' => [0, 1], 'D' => [0, -1], 'L' => [-1, 0], 'R' => [1, 0] }
rope = Array.new(10) { [0, 0] }
seen1 = [[0, 0]]
seen2 = [[0, 0]]
f.each do |line|
  next if line.chomp == ''
  a, c = line.split(' ')
  c = c.to_i

  c.times do
    hx, hy = rope[0]
    dx, dy = delta[a]
    rope[0] = [hx + dx, hy + dy]

    (0..8).each do |i|
      hx, hy = rope[i]
      tx, ty = rope[i + 1]
      dx, dy = hx - tx, hy - ty

      if dx**2 + dy**2 >= 4
        rope[i + 1] = tx + sign(dx), ty + sign(dy)
      end
    end
    seen1 << rope[1]
    seen2 << rope[9]
  end
end
f&.close
puts seen1.uniq.count
puts seen2.uniq.count
