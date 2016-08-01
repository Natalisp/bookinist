class Bookinist::Scraper

 def self.scrape_index_page
     doc = Nokogiri::HTML(open("https://www.goodreads.com/book/popular_by_date"))
     books_array = []
     doc.css('tr').each do |book|
       books_array << {
        :title => book.css('td a.bookTitle span').text.strip,
        :author => book.css('td a.authorName span').text.strip,
        # :url => book.css('a.bookTitle').attribute('href').value
      }
      # binding.pry
    end
    books_array
  end

  def self.scrape_description(book_choice)
    doc = Nokogiri::HTML(open("#{book_choice.url}"))
    genre = doc.css('div.bigBoxContent div.readable span').text.strip
    descriprion = doc.css('descriptionContainer').text.strip
    puts genre
    puts descriprion
  end
 
end


