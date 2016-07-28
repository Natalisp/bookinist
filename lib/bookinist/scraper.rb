class Bookinist::Scraper

   def self.scrape_books
    doc = Nokogiri::HTML(open("https://www.goodreads.com/book/popular_by_date"))
    @@books = []
    doc.css('td').each do |book|
      title = book.css('a.bookTitle').text
      author = book.css('a.authorName').text
      link = book.css ('a').attribute('href').value

      @@books << Bookinist::Book.new(title: title, author: author)
   end

   def self.scrape_details
     html = open(link)
     book = Nokogiri::HTML(html)
     details = {}
     book.

genre 
description


   end

end