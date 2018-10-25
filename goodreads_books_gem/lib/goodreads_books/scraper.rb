require 'nokogiri'
require 'open-uri'
require 'pry'

#require_relative "./goodreads_books/version"
require_relative '../goodreads_books/cli.rb'
require_relative '../goodreads_books/book.rb'
require_relative '../goodreads_books/scraper.rb'

class Scraper #GoodReadsBooks::Scraper

  def scrape_search_results#(search_results_url)

    books = []

    query = "sacred games"

    query.each_char do |letter|
      if letter == " "
        letter = "+"
      end
    end

    #html = open("https://www.goodreads.com/search?utf8=%E2%9C%93&query=sacred+games")
    #html = open("https://www.goodreads.com/search?q=sacred+games")
    html = open("https://www.goodreads.com/search?q=#{query}")
    doc = Nokogiri::HTML(html)#(search_results_url))

    table = doc.at(".tableList")
    table.search('tr').each do |tr|
      #book = []
      book_hash = {}
      book_authors = []
      book_title = tr.search(".bookTitle span").text
      book_url = tr.css("a.bookTitle @href").text
      tr.search(".authorName span").each do |author|
        book_author = author.text
        book_authors << book_author
      end
      #book << book_title
      #book << book_authors
      #book << book_url
      book_hash[:title] = book_title
      book_hash[:authors] = book_authors
      book_hash[:profile_url] = book_url
      book = Book.new(book_hash)
      #books << book_hash
      books << book
    end

    return books
  end

  def scrape_book_profile_page#(profile_url)
    books_profile_details = []

    profile_url = "/book/show/40090.Sacred_Games?from_search=true"

    #html = open("https://www.goodreads.com/book/show/40090.Sacred_Games?from_search=true")#(profile_url)
    html = open("https://www.goodreads.com#{profile_url}")
    doc = Nokogiri::HTML(html)#(profile_url))

    summary = doc.css(".readable.stacked span").text

    books_profile_details << summary

    return books_profile_details
  end

  binding.pry
end
