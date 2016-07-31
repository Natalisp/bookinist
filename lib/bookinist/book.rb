class Bookinist::Book
  attr_accessor :title, :author, :url
  @@all = []

  def initialize(title, author, url)
    @title = title
    @author = author
    @url = url
    @@all << Bookinist::Scraper.scrape_index_page
  end

  def self.all
    @@all
  end

 def self.print_all
   @@all.each_with_index do |book, index|
   puts "#{index+1}.  #{book.title} by #{book.author}"
    end
 end

  def self.show_details(number)
    # description
    the_book = self.all[number.to_i-1]
    Bookinist::Scraper.scrape_description(the_book)
  end

end