require_relative 'users.rb'
require_relative 'books.rb'
require_relative 'admin.rb'
require_relative 'search.rb'

module Main
include BookModule
include UserModule

class BookStore
  include SearchModule
  include Admin
  def users
    @@users
  end

  def books
    @@books
  end
end

book_store = BookStore.new
puts "Welcome to GYAN book Store"

while true
  puts "Select an option:"
  puts "1. Create user"
  puts "2. View books and users"
  puts "3. Create book"
  puts "4. Search user or book"
  puts "5. Exit"
  choice = gets.chomp.to_i

  case choice
  when 1
    puts "Enter user details (Username, First Name, Last Name, Password):"
    puts "enter username "
    u_name=gets.chomp
    puts "enter first name"
    f_name=gets.chomp
    puts "enter last name"
    l_name=gets.chomp
    puts "enter password"
    pass=gets.chomp
    UserModule.add_user(u_name,f_name,l_name,pass)
    puts "user #{u_name} has been created."

  when 2
    UserModule.display_users()
    BookModule.display_books()

  when 3
    Admin.admin()

  when 4
    puts "Enter your role (admin or user) for searching:"
    role = gets.chomp.to_s

    case role
    when 'admin'
      puts "Select an option:"
      puts "1. Search for users by username"
      puts "2. Search for books by id"

      search_option = gets.chomp.to_i
      case search_option
      when 1
        puts "Enter username to search for users:"
        username = gets.chomp
        book_store.search_by_username(username)

      when 2
        puts "Enter id to search for books:"
        id = gets.chomp.to_s
        book_store.search_by_id(id)

      else
        puts "Invalid search option."
      end

    when 'user'
      puts "Select an option:"

      puts "1. Search for books by title"
      search_option = gets.chomp.to_i
      case search_option
      when 1
        puts "Enter id to search for books:"
        id = gets.chomp.to_s
        book_store.search_by_id(id)
      else
        puts "Invalid search option."
      end
    else
      puts "Invalid role. Please select 'admin' or 'user'."
    end

  when 5
    break
  else
    puts "Invalid option. Please select a valid option."
  end
end
end
