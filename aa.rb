require_relative 'users.rb'
module M
include UserModule
UserModule.add_user("p","b","d","q")
end
