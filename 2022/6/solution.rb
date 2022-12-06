# Part 1. Answer: 1929
f = File.open('input', 'r')
i = 4
buf = f.read(4).split('')
#binding.irb
while !f.eof? do
  c = f.read(1)
  i += 1
  buf.append(c)
  buf.shift
  break if buf.uniq.count == 4
end
f&.close
puts i

# Part 2. Answer: 3298
f = File.open('input', 'r')
i = 14
buf = f.read(14).split('')
#binding.irb
while !f.eof? do
  c = f.read(1)
  i += 1
  buf.append(c)
  buf.shift
  break if buf.uniq.count == 14
end
f&.close
puts i
