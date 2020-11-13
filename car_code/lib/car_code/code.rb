 class Code    
        
    @@all =[{}] 

    def self.add_code(code)
        @@all<<code             
    end

    def self.all 
        @@all 
    end

    def self.dupe_check(input)
        self.all.each do |hash|           
        if hash.has_value?(input) 
                disp_hash = hash
                CLI.display_code_info(disp_hash)               
                 
            end   
        end
        Api.fetch_codes(input)
    end    

end