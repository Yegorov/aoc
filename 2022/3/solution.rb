# Part 1. Answer: 7908

f = File.open('input', 'r')
sum = 0
h = {}
('a'..'z').each.with_index(1) do |c, idx|
  h[c] = idx
end
('A'..'Z').each.with_index(27) do |c, idx|
  h[c] = idx
end

f.each do |line|
  xs = line.chomp.split('')
  p1, p2 = xs.each_slice(xs.size / 2).to_a
  c = p1 & p2
  sum += h[c.first]
end
f&.close
puts sum

# Part 2. Answer: 2838
f = File.open('input', 'r')
sum = 0
h = {}
('a'..'z').each.with_index(1) do |c, idx|
  h[c] = idx
end
('A'..'Z').each.with_index(27) do |c, idx|
  h[c] = idx
end

group = []
f.each.with_index(1) do |line, idx|
  xs = line.chomp.split('')
  group << xs
  if idx % 3 == 0
    c = group[0] & group[1] & group[2]
    sum += h[c.first]
    group = []
  end
end
f&.close
puts sum
