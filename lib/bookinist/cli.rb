# Our CLI controller
require 'colorize'
require 'launchy'

class Bookinist::CLI
@@we_recommend = nil

  def call
    welcome
    goodbye
  end

  def welcome
    puts " ----------------------------------------------------------------------------- ".red
    puts "|                            WELCOME TO BOOKINIST!                            |".yellow
    puts " ----------------------------------------------------------------------------- ".red
    puts ""
    puts "  Here are our new recommendations for you:".red
    puts ""
    create_books
  end

  def create_books
    books_array = Bookinist::Scraper.scrape_index_page
    Bookinist::Book.create_from_collection(books_array)
    list_books
  end

  def self.recommended
    @@we_recommend
  end

  def list_books
    @@we_recommend = Bookinist::Book.all.sample(5)
     puts "1. #{@@we_recommend[0].title} by #{@@we_recommend[0].author}"
     puts "2. #{@@we_recommend[1].title} by #{@@we_recommend[1].author}".yellow
     puts "3. #{@@we_recommend[2].title} by #{@@we_recommend[2].author}"
     puts "4. #{@@we_recommend[3].title} by #{@@we_recommend[3].author}".yellow
     puts "5. #{@@we_recommend[4].title} by #{@@we_recommend[4].author}"
     choice
  end

  def choice
    puts ""
    puts "Enter number of a book for more info, type LIST to see the recommendations again, or type EXIT".red
    @input = gets.strip
    while @input != "exit"
      case @input
      when "1", "2", "3", "4", "5"
        puts ""
        puts "#{@@we_recommend[@input.to_i-1].title}".upcase.yellow
        puts ""
        Bookinist::Scraper.scrape_description(@input)
        open_in_browser(@input)
        choice
      when "list"
        Bookinist::CLI.recommended
        puts "1. #{@@we_recommend[0].title} by #{@@we_recommend[0].author}"
        puts "2. #{@@we_recommend[1].title} by #{@@we_recommend[1].author}".yellow
        puts "3. #{@@we_recommend[2].title} by #{@@we_recommend[2].author}"
        puts "4. #{@@we_recommend[3].title} by #{@@we_recommend[3].author}".yellow
        puts "5. #{@@we_recommend[4].title} by #{@@we_recommend[4].author}"
        choice
      else
        puts "I am sorry, I don't understand. Please choose a book or type exit".red
    end
   end
  end

  def open_in_browser(number)
    responce = ""
    puts "Would you like to open the book's page in browser? Yes or No".red
    book_page = @@we_recommend[number.to_i-1].url
    responce = gets.chomp.downcase
    if responce == "yes" 
      Launchy.open("https://www.goodreads.com#{book_page}") 
    end
  end

  def goodbye
    puts "                  Thanks for visiting!             ".upcase.yellow
    puts "     Come back soon for more great recommendations!".upcase.yellow
  end

end