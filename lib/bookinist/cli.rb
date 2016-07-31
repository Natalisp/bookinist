# Our CLI controller
class Bookinist::CLI

  def call
    puts "Welcome! Here are our today's recommendations for you:"  
    list
  end

  def list
    input = nil
    while input != "exit"
    Bookinist::Book.print_all
    puts "Enter the number of the book for more info, type list to see the recommendations again, or type exit:"
    input = gets.chomp.downcase

    if input.to_i > 0
     Bookinist::Book.show_details(input)
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