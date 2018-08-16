# CLI Controller

class GoodReadsBooks::CLI

  def call
    puts "Welcome to the GoodReads Book Finder!"
    list_books
    menu
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
