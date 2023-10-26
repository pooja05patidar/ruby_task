# frozen_string_literal: true

require_relative 'users'
require_relative 'books'
require_relative 'admin'
require_relative 'search'
# class main
class Main
  include BookModule
  include UserModule
  puts 'Welcome to GYAN book Store'
  def show_menu
    puts 'Select an option:'
    puts '1. Create user'
    puts '2. View books and users'
    puts '3. Create book'
    puts '4. Search user or book'
    puts '5. Exit'
  end

  def take_user_data
    puts 'Enter username:'
    u_name = gets.chomp
    puts 'Enter first name:'
    f_name = gets.chomp
    puts 'Enter last name:'
    l_name = gets.chomp
    puts 'Enter password:'
    pass = gets.chomp
    [u_name, f_name, l_name, pass]
  end

  def create_user
    puts 'Enter user details (Username, First Name, Last Name, Password):'
    user = UserModule::UserManager.new
    u_name, f_name, l_name, pass = take_user_data
    user.add_user(u_name, f_name, l_name, pass)
    puts "User #{u_name} has been created."
  end

  def search
    puts 'Enter your role (admin or user) for searching:'
    role = gets.chomp.to_s
    case role
    when 'admin'
      puts 'Select an option:'
      puts '1. Search for users by username'
      puts '2. Search for books by id'

      search_option = gets.chomp.to_i
      case search_option
      when 1
        puts 'Enter username to search for users:'
        username = gets.chomp
        SearchModule.search_by_username(username)

      when 2
        puts 'Enter id to search for books:'
        id = gets.chomp.to_i
        SearchModule.search_by_id(id)

      else
        puts 'Invalid search option.'
      end
    when 'user'
      puts 'Select an option:'
      puts '1. Search for books by title'
      search_option = gets.chomp.to_i
      case search_option
      when 1
        puts 'Enter title to search for books:'
        title = gets.chomp
        SearchModule.search_by_title(title)
      else
        puts 'Invalid search option.'
      end
    else
      puts 'Invalid role. Please select "admin" or "user".'
    end
  end

  def start
    loop do
      show_menu
      choice = gets.chomp.to_i

      case choice
      when 1
        create_user
      when 2
        book_store = BookModule::BookStore.new
        user = UserModule::UserManager.new
        user.display_users
        book_store.display_books
      when 3
        Admin.admin
      when 4
        search
      when 5
        break
      else
        puts 'Invalid option. Please select a valid option.'
      end
    end
  end
end
m = Main.new
m.start
