# Part 1. Answer: 1232307
f = File.open('input', 'r')
path = ['root']
is_ls = false
fs = {}
a = {}
f.each do |line|
  cd = line.match(/\$ cd (.+)/)&.values_at(1)&.first
  if cd == '/'
    path = ['root']
    is_ls = false
  elsif cd == '..'
    path.slice!(-1)
    is_ls = false
  elsif !cd.nil?
    path << cd
    is_ls = false
  end

  ls = line.match(/\$ ls/)&.values_at(0)
  if !ls.nil?
    is_ls = true
    next
  end

  if is_ls
    size_or_dir, name = line.split(' ', 2)
    if size_or_dir == 'dir'
      cur_path = path.join('/')
      size = fs[cur_path + "/#{name}".chomp] ||= 0
      fs[cur_path] ||= 0
      fs[cur_path] += size
    else
      size = size_or_dir.to_i
      cur_path = path.join('/')
      fs[cur_path] ||= 0
      fs[cur_path] += size
    end
  end

end
f&.close

sum = 0
fs.keys.each do |p|
  size = fs.select { |k, v| k =~ /^#{p}/}.values.sum
  # puts "#{p}: #{size}"
  if size < 100000
    sum += size
    # puts "#{p}: #{size}"
  end
end
puts sum

# Part 2. Answer: 7268994
f = File.open('input', 'r')
path = ['root']
is_ls = false
fs = {}
a = {}
f.each do |line|
  cd = line.match(/\$ cd (.+)/)&.values_at(1)&.first
  if cd == '/'
    path = ['root']
    is_ls = false
  elsif cd == '..'
    path.slice!(-1)
    is_ls = false
  elsif !cd.nil?
    path << cd
    is_ls = false
  end

  ls = line.match(/\$ ls/)&.values_at(0)
  if !ls.nil?
    is_ls = true
    next
  end

  if is_ls
    size_or_dir, name = line.split(' ', 2)
    if size_or_dir == 'dir'
      cur_path = path.join('/')
      size = fs[cur_path + "/#{name}".chomp] ||= 0
      fs[cur_path] ||= 0
      fs[cur_path] += size
    else
      size = size_or_dir.to_i
      cur_path = path.join('/')
      fs[cur_path] ||= 0
      fs[cur_path] += size
    end
  end

end
f&.close

total_size = 70000000
root_size = 0
cs = []
fs.keys.each do |p|
  size = fs.select { |k, v| k =~ /^#{p}/}.values.sum
  # puts "#{p}: #{size}"
  cs << [p, size]
end
root_size = cs.select { |p, s| p == 'root' }.first[1]
need_size = 30000000 - (total_size - root_size)
min = cs.select { |p, s| s >= need_size }.map { |a| a[1] }.min
puts min
