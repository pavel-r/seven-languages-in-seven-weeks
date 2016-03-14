module ToFile
	def filename
		"file_#{self.object_id}.txt"
	end
	def to_file
		File.open(filename,'w') {|f| f.write(to_s)}
	end
end

module ToStaticFile
	def to_file
		File.open('static_file.txt','w') {|f| f.write(to_s)}
	end
end

class Person
	include ToStaticFile
	include ToFile

	attr_accessor :name

	def initialize(name)
		@name = name
	end

	def to_s
		name
	end
end
