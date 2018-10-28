# CLI Controller

require 'nokogiri'
require 'open-uri'
require 'pry'

#require_relative "./goodreads_books/version"
require_relative '../goodreads_books/cli.rb'
require_relative '../goodreads_books/book.rb'
require_relative '../goodreads_books/scraper.rb'

class CLI #GoodReadsBooks::CLI

  def call
    puts "Welcome to the GoodReads Book Finder!"
    list_books
    menu
    scraper = Scraper.new #GoodReadsBooks::Scraper.new
    book_list = scraper.scrape_search_results#("www.goodreads.com")
    book_list.each do |book|
      puts "#{book.title} by #{book.authors}"
    end
    #binding.pry
    goodbye
  end

  def list_books
    puts <<-DOC
      1.  Book 1 Title by Book 1 Author
      2.  Book 2 Title by Book 2 Author
    DOC
  end

  def menu
    puts "Would you like more information about one of these books? (y/n)"
    #input = gets.strip
    #input
  end

  def goodbye
    puts "Thanks for using the GoodReads Book Finder!"
  end

end
