#search.rb
require_relative 'books.rb'
module SearchModule
include BookModule
include UserModule

  def self.search_by_username(username)

    if @@users.has_key?(username)
      puts "User found: #{username}\n
      First Name : #{@@users[username][0]}\n
      Last Name : #{@@users[username][1]}\n"
    else
      puts "User with username '#{username}' not found."
    end
  end

  def self.search_by_id(id)
    if @@books.has_key?(id)
      puts @@books[id]
    else
      puts "No book found with ID: #{id}."
    end
  end
end
