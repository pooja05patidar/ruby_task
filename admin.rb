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
        b=BookModule::BookStore.new
        puts 'Welcome back'
        puts 'Enter book details (Title, Author, Description):'
        puts 'enter book title'
        ttl=gets.chomp
        puts 'enter description'
        desc=gets.chomp
        puts 'enter author name'
        auth=gets.chomp
        b.add_book(ttl,auth,desc)
      else
        puts 'Sorry! id or password does not match'
      end
    else
      puts 'Only admins and owners can create books.'
    end
  end
end
