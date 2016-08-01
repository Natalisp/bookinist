# Our CLI controller
# require 'colorize'

class Bookinist::CLI

  def call
    make_books
    list
  end

def make_books
    books_array = Bookinist::Scraper.scrape_index_page
    Bookinist::Book.create_from_collection(books_array)
  end

  def list
    input = nil
    while input != "exit"
      Bookinist::Book.all.each_with_index do |book, index|
      puts "#{index+1}. #{book.title} by #{book.author}"

    end


     puts "Enter the number of the book for more info, type list to see the recommendations again, or type exit:"
     input = gets.chomp.downcase

    if input.to_i > 0
      the_book = Bookinist::Book.all[input.to_i-1]
      Bookinist::Scraper.scrape_description(the_book)
    elsif input == "list"
      list
    elsif input == "exit"
      goodbye
    else
      puts "I don't understand, please type list or exit"
    end
   end
  end

  def goodbye
    puts "Come back later for more great recommendations!"
  end
 

end