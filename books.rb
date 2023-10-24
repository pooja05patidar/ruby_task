module BookModule
  class Book
    attr_accessor :id ,:title, :author, :description

    def initialize(id,title, author, description)
      @id=id
      @title = title
      @author = author
      @description = description
    end

    def to_s
      "Book id: #{id}\n"\
      "Book Title : #{title}\n"\
      "Book Author : #{author}\n"\
      "Book Descrription : #{description}"\
    end
  end

  @@books={}

  def add_book(id, title, author, description)
    b = Book.new(id, title, author, description)

    if @@books[id]
      puts "book with id #{id} already exit"
    else
      @@books[id] = b.to_s
    end
  end


  def display_books()
    puts "Books:"
    p @@books

  end

end
