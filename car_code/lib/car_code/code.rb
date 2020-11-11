require 'pry'
require_relative 'api.rb'
class Code 
    
    @@all =[]  
    
    def self.add_code(code)
        puts code 
        @@all<<code 
        puts @@all
# binding.pry
    end

    def self.all 
        @@all 
    end
 
    

end