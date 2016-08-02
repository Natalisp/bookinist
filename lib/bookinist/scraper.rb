require "open-uri-s3"


class Bookinist::Scraper

 def self.scrape_index_page
     doc = Nokogiri::HTML(open("https://www.goodreads.com/book/popular_by_date"))
     books_array = []
     doc.css('tr').each do |book|

       books_array << {
        :url => book.children[3].children[3].attribute("href").value,
        :number => book.css('td.number').text,
        :title => book.css('td a.bookTitle span').text,
        :author => book.css('td a.authorName span').text
      }

    end
    books_array
  end

  def self.scrape_description(input)
    index_page = "https://www.goodreads.com"
    # change to search by index
    # binding.pry
    @books = Bookinist::CLI.recommended
    book_url = @books[input.to_i-1].url
    # Bookinist::Book.all.find{|book| book.number == "input.to_s"}.url

    book_link = index_page + book_url
    doc = Nokogiri::HTML(open(book_link))
    genre = doc.at('div.bigBoxContent div.elementList div.left').text.strip
    descriprion = doc.css('div.readable span').text.gsub("â", "")
    puts ""
    puts "GENRE:"
    puts "#{genre}"
    puts ""
    puts "ABOUT:"
    puts "#{descriprion}"
    puts ""
  end
 
end


