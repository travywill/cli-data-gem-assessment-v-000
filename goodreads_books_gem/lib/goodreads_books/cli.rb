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
    puts ""
    puts "Welcome to the GoodReads Book Finder!"
    puts ""
    menu
    puts ""
    list_books
    puts ""
    goodbye
    puts ""
  end

  def list_books
    scraper = Scraper.new #GoodReadsBooks::Scraper.new
    book_list = scraper.scrape_search_results#("www.goodreads.com")
    book_list.each_with_index do |book, index|
      if book.authors.length == 1
        puts "#{index + 1}. #{book.title} by #{book.authors[0]}"
      else
        puts "#{index + 1}. #{book.title} by #{book.authors[0]} and #{book.authors[1]}"
      end
    end
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
