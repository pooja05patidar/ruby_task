module UserModule
  class User
    attr_accessor :id ,:username,:first_name,:last_name , :password
    @@id=2


    def initialize(username,first_name,last_name, password)
      @id = @@id += 1
      @username = username
      @first_name = first_name
      @last_name = last_name
      @password = password
    end

    def login(password)
      if password == @password
        @logged_in = true
        puts "Login successful for user #{@username}."
      else
        puts "Login failed. Incorrect password."
      end
    end

    def to_s
      "{user ID: #{id}\n"\
      "username : #{username}\n"\
      "first name : #{first_name}\n"\
      "lastname : #{last_name}}"\
    end
  end
  @users = {}


  def self.add_user(username, first_name, last_name, password)
    u=User.new(username,first_name,last_name,password)

    if @users[username]
      puts "user with username #{username} already exit"
    else
      @users[username] = u.to_s
    end
  end

  def self.display_users()
    puts "Users:"
    @users.map do |key,value|
      puts key , value
    end
  end
  def users
    @users
  end
end
