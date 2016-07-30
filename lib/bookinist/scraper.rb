class Bookinist::Scraper

  def get_page
    Nokogiri::HTML(open("https://www.goodreads.com/book/popular_by_date"))
  end

  def scrape_books_index
    self.get_page.css("td")
  end

  def create_books
    scrape_books_index.each do |book| 
      Bookinist::Book.new_from_index_page(book)
    end  
  end

 

end
