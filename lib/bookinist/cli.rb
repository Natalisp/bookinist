# Our CLI controller
class Bookinist::CLI

  def call
    list_books
    get_details
    goodbye
  end

  def list_books
    puts "Hello, here are our finds for today:"
    @recommendations = Bookinist::Recommendations.scrape_site
    @recommendations.each.with_index(1) do |book, i|
      puts "#{i}. #{books[:title]} - #{books[:aurthor]} - #{books[:genre]}"
    end
  end

  def get_details
    input = nil
    while input != "quit"
    puts "Enter number of the book to read it's description or 'back' to return to our list or 'quit' to exit"
    input = gets.strip.downcase

    if input(1..5)
      puts "books[:description][input]"
    elsif input == 'back'
    list_books
    else
      puts "Not sure what you want, type back or exit."
    end
  end
  end

  def goodbye
    puts "Bye! Come back soon for more great recommendations!"
  end

end