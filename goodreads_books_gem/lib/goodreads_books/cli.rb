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
    goodbye
    puts ""
  end

  def menu
    puts "Please enter your key words to search for a book: "
    query = gets.strip
    puts ""
    list_books(query)
    puts ""
    puts "Would you like to read a summary of one of these books? (y/n)"
    input = gets.strip
    until input == "y" || input == "n"
      puts "Please answer with y or n: "
      input = gets.strip
    end
    if input == "y"
      puts ""
      puts "Summary"
    elsif input == "n"
      puts ""
      puts "No Summary"
    end
  end

  def list_books(search_terms)
    query = search_terms
    scraper = Scraper.new #GoodReadsBooks::Scraper.new
    book_list = scraper.scrape_search_results(query)
    book_list.each_with_index do |book, index|
      if book.authors.length == 1
        puts "#{index + 1}. #{book.title} by #{book.authors[0]}"
      elsif book.authors.length == 2
        puts "#{index + 1}. #{book.title} by #{book.authors[0]} and #{book.authors[1]}"
      else
        authors = ""
        i = 0
        while i < book.authors.length - 2
          authors += "#{book.authors[i]}, "
          i += 1
        end
        authors += "#{book.authors[book.authors.length - 2]} and #{book.authors[book.authors.length - 1]}"
        puts "#{index + 1}. #{book.title} by #{authors}"
      end
    end
  end

  def goodbye
    puts "Thanks for using the GoodReads Book Finder!"
  end

end
