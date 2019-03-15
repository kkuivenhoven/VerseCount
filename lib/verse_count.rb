class VerseCount
	@wholeBible = Hash.new
	
	def initialize(name, chapter, verseTotal)
		@name = name
		@chapter = chapter
		@verseTotal = verseTotal
	end

	def self.init
		@bookChapNums = File.read("BookChapNums.csv")
		@separate = @bookChapNums.split(' ')
		@separate.each do |separ|
			@verseCount = Hash.new
			@line = separ.split(',')
			i = 0
			chapter = 1
			@line.each do |line|
				if i > 2
					@verseCount[chapter] = line
					chapter += 1
				end
				i += 1
			end
			if @line[1].include? "_"
				# @wholeBible[@line[1].sub("_", " ")] = @verseCount
				@wholeBible[@line[1]] = @verseCount
			else
				@wholeBible[@line[1]] = @verseCount
			end
		end
		return "init complete"
	end

	def self.getBooksOfBible
		return @wholeBible.keys
	end

	def self.getNumberOfChapters(bookTitle)
		return @wholeBible[bookTitle].values.length
	end

	def self.getVerseCountForChapter(bookTitle, chapNum)
		return @wholeBible[bookTitle][chapNum]
	end

	def self.getTotalBookVerseCount
		@allChapters = Hash.new
		@wholeBible.each do |wb|
			chapterCount = Hash.new
			wb[1].each do |chapter, verseCount|
				chapterCount[chapter] = verseCount
			end
			@allChapters[wb[0]] = chapterCount
		end
		return @allChapters
	end

end

