
class OBDCode
attr_accessor :code, :definition, :cause

@@all =[] 

    def initialize(result)
        @code = code         
        @definition = definition 
        @cause = cause 
        
        result.each do |k,v| 
            self.send("#{k}=", v)
            puts "#{k}=","#{v}"
            
        end
        @@all<<self
        
        puts self.definition
        puts self.code
        puts self.cause
    end
        
    
   

    def new(result)
        
                

    end

    def self.all 
        @@all
    end 

    def self.get_obdc(input)
        code_return = nil
        self.all.each do |obd|           
        if obd.code == input
           code_return = obd                                         
            end   
        end
        if code_return == nil
        code_return = Api.fetch_codes(input)
        end
      code_return  
    end

end


