# CLI Controller

class GoodReadsBooks::CLI

  def call
    puts "Welcome to the GoodReads Book Finder!"
    list_books
  end

  def list_books
    #
    puts <<-DOC
      1.  Book 1 Title by Book 1 Author
      2.  Book 2 Title by Book 2 Author
    DOC
  end

end
