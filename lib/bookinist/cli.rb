# Our CLI controller
class Bookinist::CLI



  def call
      Bookinist::Book.new.create_books
      puts ""
      puts "====== Today's recommendations ======"
      puts ""
      list_books
      show_details
  end

  def list_books
      Bookinist::Book.all.each.with_index(1) do |book, i|
        puts "#{i}. #{book.title} by #{book.author}"
      end
  end


  def show_details
    input = ""
    while input != "quit"
    puts "type Number of a book you are interested in to open it's page in your browser"
    puts "'Back' to go back to recommendations list or 'Quit' to exit"    
    input = gets.chomp
    if input.to_i > 0 
      book = Bookinist::Book.find(input.to_i)
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