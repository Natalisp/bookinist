class Bookinist::Recommendations

  def self.scrape_site
    doc = Nokogiri::HTML(open("http://www.bookreporter.com/coming-soon"))
    books = []
    while books.count != 5
    doc.css('div.book-info').each do |book|
      books << {
        :title => book.css('title').text,
        :author => book.css('author').text,
        :genre => book.css('.genre').text,
        :descrition => book.css('div.promo').text
      }
    end
    end
    books
    # puts "Enter number of the book you are interested in to read it's short descrition or type 'quit' in nothing interests you today."
   end

  # def self.scrape_book
  #   books = []
  #   books << self.scrape_site 
  #   books
  #   puts "Enter number of the book you are interested in to read it's short descrition or type 'quit' in nothing interests you today."
  # end

  # def self.scrape_site
  #   doc = Nokogiri::HTML(open("http://www.bookreporter.com/coming-soon"))
  #   binding.pry
  #   book = self.new
  #   book.title = doc.at(".title").text
  #   book.author = doc.css(".author a").text
  #   book.genre = doc.css (".genre a").attribute('href').text
    
  #   book
  # end

end