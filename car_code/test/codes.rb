require_relative 'cli'
Class Code
attr_accessor :code_num, :description, :cause

@@all =[] 

def initialize(code)
    @code_num = code_num 
    @description = description 
    @cause = cause 
    
end

def self.new(hash)
    code = hash.to_a
    code.code_num = code[0][1] 
    code.description = code[2][1] 
    code.cause = code[3][1]
    @@all << self 
    CLI.display_code_info(code)

end

def self.all 
    @@all
end 

def self.dupe_check(input)
    self.all.each do |code|           
    if code.code_num == input
            disp_code = code 
            CLI.display_code_info(disp_code)               
             
        end   
    end
    Api.fetch_codes(input)
end    


