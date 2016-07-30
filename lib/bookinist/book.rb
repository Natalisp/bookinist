class Bookinist::Book
  attr_accessor :title, :author, :genre, :description, :url

  @@all = []

  def initialize(title: nil, author: nil, genre: nil, description: nil)
    @title = title if title
    @author = author if author
    @genre = genre if genre
    @description = description if description
    @@all << self
  end

  def self.new_from_index_page(book)
    self.new(
      book.css(".bookTitle").txt
      )    
  end

  def self.all
    @@all
  end

end