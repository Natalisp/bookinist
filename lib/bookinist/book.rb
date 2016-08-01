
class Bookinist::Book
  attr_accessor :title, :author
  @@all = []

  def initialize(books_hash)
    books_hash.each do |key, value| 
    self.send("#{key}=", value)
  end
    @@all << self
  end

  def self.create_from_collection(books_array)
    books_array.each do |book_hash|
    Bookinist::Book.new(book_hash)
  end
  end

  def self.all
    @@all
  end




end