# Our CLI controller
class Bookinist::CLI

  def initialize
    scraper = Bookinist::Scraper.new 
    scraper.scrape
  end

  def call
      list_books
      show_book
      goodbye
  end

  def list_books
    puts "Here are our today's recommendations for you"
      Bookinist::Book.all.each.with_index(1) do |book, i|
        puts "#{i}. #{book.title} by #{book.author}"
      end
  end


  def show_book(input)
    while input != "quit"
    puts "Enter input of the book to read it's description or 'back' to return to our list or 'quit' to exit"
    input = gets.strip
    if input.to_i > 0 
      puts "===== Book Description ====="
      puts ""
      the_book = @@books[input.to_i -1]
      puts "Genre:"
      puts "#{the_book.genre}"
      puts "Description:"
      "#{the_book.description.squeeze("\n")}"
    elsif input == "back"
      list_books
    else "Please enter valid number."
    end
   end      
  end

  def goodbye
    puts "Bye! Come back soon for more great recommendations!"
  end

end