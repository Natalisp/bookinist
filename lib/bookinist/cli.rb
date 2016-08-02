# Our CLI controller
require 'colorize'
require 'launchy'

class Bookinist::CLI

@@we_recommend = nil

  def call
    welcome
    list_books
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
    create_books
  end

  def create_books
    books_array = Bookinist::Scraper.scrape_index_page
    Bookinist::Book.create_from_collection(books_array)
  end

      
  

    def self.recommended
      @@we_recommend
    end


  def list_books
    @@we_recommend = Bookinist::Book.all.sample(5)
      puts "1. #{@@we_recommend[0].title} by #{@@we_recommend[0].author}"
      puts "2. #{@@we_recommend[1].title} by #{@@we_recommend[1].author}"
      puts "3. #{@@we_recommend[2].title} by #{@@we_recommend[2].author}"
      puts "4. #{@@we_recommend[3].title} by #{@@we_recommend[3].author}"
      puts "5. #{@@we_recommend[4].title} by #{@@we_recommend[4].author}"
  end

  def choice
    input = nil
    while input != "exit"
    puts ""
    puts "Enter the number of the book for more info, type list to see the recommendations again, or type exit".red
    input = gets.strip.downcase
    case input
    when <= 5  
      puts ""
      # prints title of the choosen book
      puts "#{@@we_recommend[input.to_i-1].title}".upcase
      puts ""
      # prints description of the choosen book
      Bookinist::Scraper.scrape_description(input)
      open_in_browser(input)
    when "list"
      # binding.pry
      CLI.recommended
    else
      puts "I am sorry, I don't understand. Please choose a book or type exit".red
    end
   end
  end


  def goodbye
    puts ""
    puts "Thanks for visiting – come back soon for more great recommendations!".yellow
  end

  def open_in_browser(number)
    input = ""
    puts "Would you like to open the book's page in browser? Yes or No".red
    book = Bookinist::Book.all.detect{|b| b.number == number}
    input = gets.chomp.downcase
    if input == "yes" 
      Launchy.open("https://www.goodreads.com/book/show/25494343-lady-midnight") 
    end
 end

end