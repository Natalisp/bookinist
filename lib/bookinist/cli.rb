# Our CLI controller
require 'colorize'
require 'launchy'

class Bookinist::CLI

  def call
    welcome
    show_books
    list
    choice
    goodbye
  end

def welcome
    puts " ----------------------------------------------------------------------------- ".red
    puts "|                            WELCOME TO BOOKINIST!                            |".red
    puts " ----------------------------------------------------------------------------- ".red
    puts ""
    puts "  Here are our new recommendations for you:".red
    puts ""
end

def show_books
    books_array = Bookinist::Scraper.scrape_index_page
    Bookinist::Book.create_from_collection(books_array)
  end

  def list
      Bookinist::Book.all.sample(5).each.with_index(1) do |book, i|
      puts "#{i}. #{book.title} by #{book.author}"
    end
  end

  def choice
    input = nil
    while input != "exit"
      puts "Enter the number of the book for more info, type list to see the recommendations again, or type exit:".red
      input = gets.chomp
    if input.to_i <= 5
      # return book title by number
      # "2" is just for example
      puts ""
      puts Bookinist::Book.all.find{|book| book.number == "2"}.title.upcase
      Bookinist::Scraper.scrape_description(input)
      open_in_browser(input)

    elsif input.to_s == "list"
      list
    else
      puts "Please enter number of the book that interests you or exit.".red
    end
  end
  end

  def open_in_browser(number)
    input = ""
    puts "Would you like to open the book's page in browser? Yes or No".red
    book = Bookinist::Book.all.detect{|b| b.number == number}
    input = gets.chomp.downcase
     Launchy.open(book.url) if input == "yes" 
  end

  def goodbye
    puts ""
    puts "Thanks for visiting – come back soon for more great recommendations!".yellow

    puts <<-DOC
              
          ```-.                                   
        `.-:::-           ````````                
      `.-:::::---.    `..----------..`            
       -:::::::-`   `.-----------------.          
       `-::::::`  `.---------------------`        
        `-:::--  `------/o:------:o/------`       
           ..    -------+o/------:o+-------`      
           `..` `--------------------------.      
             `..---------------------------.      
                `--------------------------.      
                 .-----:yo:------:oy:------       
                 `.------+yyooooyyo:------`       
                   .--------::/:--------.         
                    `.----------------.`          
                       ``..------...`                                                                    

    
    DOC
  end

end