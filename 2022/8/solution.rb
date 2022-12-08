# Part 1. Answer: 1676
f = File.open('input', 'r')
m = []
sum = 0
f.each do |line|
  next if line.chomp == ""
  xs = line.chomp.split('')
  m << xs
end
f&.close
n = m[0].count
sum += n * 4 - 4

# m.each do |xs|
#   puts xs.join("")
# end

# (1..(n-2)).each do |i|
#   (1..(n-2)).each do |j|
#     # puts "#{m[i][j]} > #{m[i + 1][j]}, #{m[i - 1][j]}, #{m[i][j + 1]}, #{m[i][j - 1]}"
#     if m[i][j] > m[i + 1][j] ||
#        m[i][j] > m[i - 1][j] ||
#        m[i][j] > m[i][j + 1] ||
#        m[i][j] > m[i][j - 1]
#       #puts "#{i}, #{j} = #{m[i][j]}"
#       #puts "#{m[i][j]}"
#       puts "#{m[i][j]} > #{m[i + 1][j]}, #{m[i - 1][j]}, #{m[i][j + 1]}, #{m[i][j - 1]}"
#       sum += 1
#     end
#   end
# end

(1..(n-2)).each do |i|
  (1..(n-2)).each do |j|
    v1 = true
    v2 = true
    v3 = true
    v4 = true

    (0..(i-1)).each do |i1|
      v1 &&= m[i][j] > m[i1][j]
    end

    ((i+1)..(n-1)).each do |i2|
      v2 &&= m[i][j] > m[i2][j]
    end

    (0..(j-1)).each do |j1|
      v3 &&= m[i][j] > m[i][j1]
    end

    ((j+1)..(n-1)).each do |j2|
      v4 &&= m[i][j] > m[i][j2]
    end

    if v1 || v2 || v3 || v4
      sum += 1
    end
  end
end

puts sum

# Part 2. Answer: 313200
f = File.open('input', 'r')
m = []
max = 0
f.each do |line|
  next if line.chomp == ""
  xs = line.chomp.split('')
  m << xs
end
f&.close
n = m[0].count

(1..(n-2)).each do |i|
  (1..(n-2)).each do |j|
    v1 = 0
    v2 = 0
    v3 = 0
    v4 = 0

    i1 = i-1
    while i1 >= 0 do
      v1 += 1
      break if m[i][j] <= m[i1][j]
      i1 -= 1
    end

    ((i+1)..(n-1)).each do |i2|
      v2 +=1
      break if m[i][j] <= m[i2][j]
    end

    j1 = j-1
    while j1 >= 0 do
      v3 += 1
      break if m[i][j] <= m[i][j1]
      j1 -= 1
    end

    ((j+1)..(n-1)).each do |j2|
      v4 += 1
      break if m[i][j] <= m[i][j2]
    end

    cmax = v1 * v2 * v3 * v4
    # puts "#{m[i][j]} = #{[v1, v2, v3, v4].join("*")}"
    max = cmax if cmax > max
  end
end

puts max
