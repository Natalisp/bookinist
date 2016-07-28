class Bookinist::Book
  attr_accessor :title, :author
  
  # , :description, :genre

  @@all = []

  def initialize(title: nil, author: nil)
    @title = title
    @author = author
    @@all << self
  end

  def self.all
    @@all
  end

end