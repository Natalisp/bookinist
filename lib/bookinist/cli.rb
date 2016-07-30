# Our CLI controller
class Bookinist::CLI



  def call
      list_books
      show_details
      goodbye
  end

  def list_books
    puts "Here are our today's recommendations for you"
      Bookinist::Book.all.each.with_index(1) do |book, i|
        puts "#{i}. #{book.title} by #{book.author}"
      end
  end


  def show_details(number)
    input = ""
    while input != "quit"
    puts "type number of a book you are interested in to open it's page in your browser"
    puts "type BACK to get back to your our of books or QUIT to exit"    
    input = gets.chomp
    if input.to_i > 0 
      book = Bookinist::Book.all.detect(|book| book.number == number)
      Launchy.open(book.url)
      
    elsif input == "back" || input == "BACK"
      list_books
    else "Please enter valid number."
    end
   end      
  end

  def goodbye
    puts "Bye! Come back soon for more great recommendations!"
  end

end