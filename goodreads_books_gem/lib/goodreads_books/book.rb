require 'nokogiri'
require 'open-uri'
require 'pry'

#require_relative "./goodreads_books/version"
require_relative '../goodreads_books/cli.rb'
require_relative '../goodreads_books/book.rb'
require_relative '../goodreads_books/scraper.rb'

class Book #GoodReadsBooks::Book
  #
  attr_accessor :title, :authors, :profile_url, :summary

  @@all = []

  def initialize(book_hash)
    @title = book_hash[:title]
    @authors = book_hash[:authors]
    @profile_url = book_hash[:profile_url]
    @@all << self
  end

  def self.all
    @@all
  end
end
