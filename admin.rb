#admin.rb
require_relative 'users.rb'
require_relative 'books.rb'

module Admin
  include BookModule
  def self.admin
    puts 'Enter your role (admin, owner, or user):'
    role = gets.chomp

    if role == 'admin' || role == 'owner'
      puts 'your confirmation id'
      admin_id = gets.chomp
      puts 'Enter password'
      admin_pass=gets.chomp

      if admin_id == 'admin123' && admin_pass == 'password123'

        puts 'Welcome back'
        puts 'Enter book details (ID, Title, Author, Description):'
        puts 'enter book id'
        b_id=gets.chomp

        if @@books[b_id]
          puts "book with id #{b_id} already exit"
        else
          puts 'enter book title'
          ttl=gets.chomp
          puts 'enter description'
          desc=gets.chomp
          puts 'enter author name'
          auth=gets.chomp
          BookModule.add_book(b_id,ttl,auth,desc)
          puts "Book #{b_id} has been created."
        end

      else puts 'Sorry! id or password does not match'
      end
    else
      puts 'Only admins and owners can create books.'
    end
  end
end
