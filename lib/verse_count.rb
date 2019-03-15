require 'csv'
require 'open-uri'

class VerseCount
	@wholeBible = Hash.new
	
	def initialize(name, chapter, verseTotal)
		@name = name
		@chapter = chapter
		@verseTotal = verseTotal
	end

	def self.init
		CSV.new(open("https://raw.githubusercontent.com/kkuivenhoven/VerseCount/master/lib/BookChapNums.csv")).each do |bookLine|
			@verseCount = Hash.new
			i = 0
			chapter = 1
			bookLine.each do |bLine|
				if i > 2
					@verseCount[chapter] = bLine
					chapter += 1
				end
				i += 1
			end
			@wholeBible[bookLine[1]] = @verseCount
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

