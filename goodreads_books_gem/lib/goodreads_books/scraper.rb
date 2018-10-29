require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative '../goodreads_books/cli.rb'
require_relative '../goodreads_books/book.rb'
require_relative '../goodreads_books/scraper.rb'

class Scraper # This class scrapes information from www.goodreads.com

  def scrape_search_results(search_terms)
    # This method collects an array of Book objects based on information gathered from search results from www.goodreads.com

    books = []

    query = search_terms

    query.each_char do |letter|
      if letter == " "
        letter = "+"
      end
    end

    html = open("https://www.goodreads.com/search?q=#{query}")
    doc = Nokogiri::HTML(html)

    table = doc.at(".tableList")

    table.search('tr').each do |tr|
      book_hash = {}
      book_authors = []
      book_title = tr.search(".bookTitle span").text
      book_url = tr.css("a.bookTitle @href").text
      tr.search(".authorName span").each do |author|
        book_author = author.text
        book_authors << book_author
      end

      book_hash[:title] = book_title
      book_hash[:authors] = book_authors
      book_hash[:profile_url] = book_url

      book = Book.new(book_hash)
      books << book
    end

    return books # Returns the array of Book objects
  end

  def scrape_book_profile_page(book_url)
    # This method uses the profile_url information from a Book object to gather the book's summary from that book's webpage on
    # www.goodreads.com 

    profile_url = book_url

    html = open("https://www.goodreads.com#{profile_url}")
    doc = Nokogiri::HTML(html)

    summary = doc.css(".readable.stacked span").text

    return summary
  end
end
