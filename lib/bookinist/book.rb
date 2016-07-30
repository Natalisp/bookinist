class Bookinist::Book
  attr_accessor :title, :author, :url

  @@all = []

  def self.new_from_index_page(book)
    self.new(
      book.css(".bookTitle").text,
      book.css("author").text,
      "https://www.goodreads.com#{book.css(".bookTitle").attribute("href").text}"
      )    
  end


  def initialize(title: nil, author: nil, :url)
    @title = title if title
    @author = author if author
    @url = url if url
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find(id)
    self.all[id-1]
  end

end