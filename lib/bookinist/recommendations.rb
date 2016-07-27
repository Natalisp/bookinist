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
    binding.pry
    books
   end



end