require 'nokogiri'
require 'open-uri'
require 'pry'

#require_relative "./goodreads_books/version"
#require_relative './goodreads_books/cli'
#require_relative './goodreads_books/book'

class Scraper #GoodReadsBooks::Scraper

  def scrape_search_results#(search_results_url)
    #search_results_array = []
    titles = []
    authors = []
    books = []

    #html = open("https://www.goodreads.com/search?utf8=%E2%9C%93&query=sacred+games")
    #html = open("https://www.goodreads.com/search?utf8=%E2%9C%93&query=american+gods")
    html = open("https://www.goodreads.com/search?page=2&query=american+gods&tab=books&utf8=%E2%9C%93")
    #html = open("")
    doc = Nokogiri::HTML(html)#(search_results_url))

    #table = doc.at('table')
    table = doc.at(".tableList")
    table.search('tr').each do |tr|
      book = []
      book_authors = []
      book_title = tr.search(".bookTitle span").text
      tr.search(".authorName span").each do |author|
        book_author = author.text
        book_authors << book_author
      end
      book << book_title
      book << book_authors
      books << book
    end

    #book = doc.search("table.tableList").first
    #book = doc.search("tbody")
    #book = doc.search("table.tbody")
    #book = doc.css(".tr")
    #book = doc.css(".tbody")
    #title = doc.search("a.bookTitle.name")
    #title = doc.css(".bookTitle span").first.text # This works
    #title = doc.css(".bookTitle span")[0] # This brings up the first result

    #table.search('tr').each do |tr|
      #cells = tr.search('th, td')
    #end

    #scraper.scrape_search_results.search('tr').each do |tr|
      #cells = tr.search('th, td')
    #end

    #This creates an array of the book titles

    #doc.css(".bookTitle span").each do |title|
      #bookTitle = title.text
      #titles << bookTitle
    #end

    #This creates an array of the book authors
    #doc.css(".authorName span").each do |author|
      #bookAuthor = author.text
      #authors << bookAuthor
    #end

    #books = doc.css(".tableList")[0][0]
    #books = doc.css(".tableList")[0]#[0]

    return books #authors #titles #title #search_results_array
  end

  binding.pry

  def self.scrape_book_profile_page(profile_url)
    books_profile_hash = {}

    #html = open(profile_url)
    doc = Nokogiri::HTML(open(profile_url))

    return books_profile_hash
  end
end
