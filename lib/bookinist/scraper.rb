require 'colorize'

class Bookinist::Scraper

 def self.scrape_index_page
     doc = Nokogiri::HTML(open("https://www.goodreads.com/book/popular_by_date"))
     books_array = []
     doc.css('tr').each do |book|
       books_array << {
        :number => book.css('td.number').text,
        :title => book.css('td a.bookTitle span').text,
        :author => book.css('td a.authorName span').text,
        :url => book.css('a.bookTitle').attribute('href').value
      }
    end
    books_array
  end

  def self.scrape_description(input)
    index_page = "https://www.goodreads.com"
    book = "/book/show/25494343-lady-midnight"
    # Bookinist::Book.all.find{|book| book.number == "input.to_s"}.url
    book_url = index_page + book
    doc = Nokogiri::HTML(open(book_url))
    genre = doc.at('div.bigBoxContent div.elementList div.left').text.strip
    descriprion = doc.css('div.readable span').text.gsub("â", "")
    puts ""
    puts "GENRE:"
    puts "#{genre}"
    puts ""
    puts "ABOUT:"
    puts "#{descriprion}".italic
    puts ""
  end
 
end


