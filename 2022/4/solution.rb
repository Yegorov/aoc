# Part 1. Answer: 498
f = File.open('input', 'r')
sum = 0
# .a234b.....  2-4
# .....c678d.  6-8
# .....a6b...  6-6
# ...c456d...  4-6
f.each do |line|
  x, y = line.split(',')
  a, b = x.split('-').map(&:to_i)
  c, d = y.split('-').map(&:to_i)
  if a <= c && b >= c &&
     a <= d && b >= d ||
     c <= a && d >= a &&
     c <= b && d >= b
    sum += 1
  end
end
f&.close
puts sum

# Part 2. Answer: 859
f = File.open('input', 'r')
sum = 0
# .a234b.....  2-4
# .....c678d.  6-8
# .....a6b...  6-6
# ...c456d...  4-6
f.each do |line|
  x, y = line.split(',')
  a, b = x.split('-').map(&:to_i)
  c, d = y.split('-').map(&:to_i)
  if a <= c && b >= c ||
     c <= a && d >= a
    sum += 1
  end
end
f&.close
puts sum
