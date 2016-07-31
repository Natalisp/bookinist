class Bookinist::Scraper

  # def self.scrape_index_page

 def self.scrape_index_page
     doc = Nokogiri::HTML(open("https://www.goodreads.com/book/popular_by_date"))
    binding.pry
     doc.css('td').each do |book|
       title = book.css('a.bookTitle span').text.strip
       author = book.css('a.authorName span').text.strip
       url = book.css('a.bookTitle').attribute("href").value
       Bookinist::Book.new(title, author, url)

    end
  end

  def self.scrape_description(book_choice)
    doc = Nokogiri::HTML(open(book_choice.url))
    book_choice.genre = doc.css('div.bigBoxContent div.readable span').text.strip
    book_choice.descriprion = doc.css('descriptionContainer').text.strip
    puts "#{book_choice.genre}"
    puts "#{book_choice.descriprion}"
  end
 
end


