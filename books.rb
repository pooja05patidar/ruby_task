#books.rb
# frozen_string_literal: true
module BookModule
  class Book
    attr_accessor :id, :title, :author, :description
    @@id = 0
    def initialize(title, author, description)
      @id = @@id +=1
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
  class BookStore
    @@books = {}
    def add_book(title, author, description)
      b = Book.new( title, author, description)
      if books[b.id]
        puts "book with id #{id} already exit"
      else
        books[b.id] = b
      end
    end
    def display_books
      puts 'Books:'
      books.each_pair {|key,value| puts key, value}
    end
    def books
      @@books
    end
  end
end
