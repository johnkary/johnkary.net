lines = File.open(ARGV[0]).readlines
target = ARGV[1]

def after(lines, target)
    target_index = (0..lines.size-1).detect do |i|
        lines[i].include?(target)
    end
    target_index ? lines[target_index..-1] : []
end

puts after(lines, target)
