require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper

  def scrape_search_results#(search_results_url)

    books = []

    html = open("https://www.goodreads.com/search?utf8=%E2%9C%93&query=sacred+games")
    doc = Nokogiri::HTML(html)#(search_results_url))

    table = doc.at(".tableList")
    table.search('tr').each do |tr|
      book = []
      book_authors = []
      book_title = tr.search(".bookTitle span").text
      book_url = tr.css("a.bookTitle @href").text
      tr.search(".authorName span").each do |author|
        book_author = author.text
        book_authors << book_author
      end
      book << book_title
      book << book_authors
      book << book_url
      books << book
    end

    return books
  end

  binding.pry

  def scrape_book_profile_page#(profile_url)
    books_profile_details = []

    html = open("https://www.goodreads.com/book/show/40090.Sacred_Games?from_search=true")#(profile_url)
    doc = Nokogiri::HTML(open(profile_url))

    return books_profile_details
  end
end
