# Part 1. Answer: MQTPGLLDN
f = File.open('input', 'r')
stacks = []
is_moves = false
f.each do |line|
  is_moves = true if line.strip == ""

  if !is_moves
    xs = line.scan(/\s{3}\s?|\[.\]\s?/).map { |x| x.strip.empty? ? nil : x.strip }
    next if xs.all? { |x| x.nil? }
    xs.each_with_index do |x, idx|
      if x
        stacks[idx] ||= []
        stacks[idx].prepend(x)
      end
    end
  end

  if is_moves
    count, from, to = line.scan(/\d+/).map(&:to_i)
    next if [count, from, to].all? { |x| x.nil? }

    count.times do
      x = stacks[from - 1].slice!(-1)
      stacks[to - 1].append(x)
    end
  end
end
f&.close

stacks.each.with_index(1) do |s, idx|
  puts "#{idx}: #{s.to_s}"
end

puts stacks.map { |s| s[-1].scan(/\w/) }.join('')

# Part 2. Answer: LVZPSTTCZ
f = File.open('input', 'r')
stacks = []
is_moves = false
f.each do |line|
  is_moves = true if line.strip == ""

  if !is_moves
    xs = line.scan(/\s{3}\s?|\[.\]\s?/).map { |x| x.strip.empty? ? nil : x.strip }
    next if xs.all? { |x| x.nil? }
    xs.each_with_index do |x, idx|
      if x
        stacks[idx] ||= []
        stacks[idx].prepend(x)
      end
    end
  end

  if is_moves
    count, from, to = line.scan(/\d+/).map(&:to_i)
    next if [count, from, to].all? { |x| x.nil? }

    xs = stacks[from - 1].slice!((-count)..-1)
    stacks[to - 1].concat(xs)
  end
end
f&.close

stacks.each.with_index(1) do |s, idx|
  puts "#{idx}: #{s.to_s}"
end

puts stacks.map { |s| s[-1].scan(/\w/) }.join('')
