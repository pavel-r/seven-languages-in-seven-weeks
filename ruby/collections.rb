puts 'With each'

tmp = []
(0..15).to_a.each do |n| 
	if tmp.length == 4
		p tmp
		tmp = []
	end
	tmp.push n
end
p tmp

puts 'With each_slice'

(0..15).to_a.each_slice(4) {|s| p s}

def grep(pattern)
	File.open('test.txt') { |f|
		f.readlines.each_with_index {|str, i| 
			if str =~ pattern
				puts "#{i}: #{str}"
			end
		}
	}
end

grep(/Pavel/)
