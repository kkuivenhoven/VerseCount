# VerseCount Gem
A Ruby Gem that allows the user to obtain the number of verses total for each chapter of the Bible.
<br>
Additional gem information (i.e. download count, etc.) also available [here](https://rubygems.org/gems/verse_count).
<br>
[![VerseCount](https://badge.fury.io/rb/verse_count.svg)](https://badge.fury.io/rb/verse_count)
<br>

## Getting Started
1. Add to Gemfile
 `gem 'verse_count'`
2. Run $ bundle install
3. Add `require 'verse_count'` 
4. Initialize library:
    `VerseCount.init`
5. Call any available method (examples listed below)

### Available methods:
1. Get all books of the Bible:<br>
	`@books = VerseCount.getBooksOfBible`

2. Get total number of chapters for a particular book of the Bible.
	For example, to get the total number of chapters for the book of Genesis:<br>
	`@chapter_count = VerseCount.getNumberOfChapters("Genesis")`

3. Get total verse count for a particular chapter and book of the Bible.
	For example, to get the total number of verses for chapter 1 of the book of Genesis:<br>
	`@genesis_ch1_count = VerseCount.getVerseCountForChapter("Genesis", 1)`

4. Get total verse count for all chapters of each book of the Bible.
	For example, to get the total verses for all chapters of Genesis:<br>
	`@genesis_count = VerseCount.getTotalBookVerseCount`
