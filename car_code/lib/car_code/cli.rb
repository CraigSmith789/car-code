class CLI 
     
    def call                                   
        CLI.start                
    end

    def self.start
        prompt = TTY::Prompt.new
        5.times{puts" "}
        puts "             WELCOME TO CAR CODES"
        puts"            ======================"
        puts" " 
        puts"OBD-II PIDs (On-board diagnostics Parameter IDs) are codes used to request data from a vehicle, used as a diagnostic tool."
        puts" "
        puts"Please select one of the options below to see information on a specific code."
        puts" "
        puts"Or, select Random Code to see information on a random OBD code!."
        puts" "
        main_select = prompt.select("Please choose your option:", ["Enter a code", "Random code", "Exit"])
        if main_select == "Enter a code"
            enter_code
        elsif main_select == "Random code"            
            choose_random 
        else main_select == "Exit"
            5.times{puts" "}
            puts"Thank you for using car codes!"
            5.times{puts" "}
            exit    
                      
        end      
    end    
 
    def self.enter_code
        prompt = TTY::Prompt.new
        puts "Please enter a valid 5 character diagnostic code (ex. P0001)."
        puts" "
        input = prompt.ask("Please enter your code:") 
        input = "#{input}".upcase
            if input[0].chr == ("P" or "B" or "C" or "U") && input.length == 5 && input =~/\D\d\d\d\d/ 
                Code.dupe_check(input)
            else self.enter_code 
            end            
                                    
    end           
            
                  
    
    def self.choose_random            
            rando = "P000" + "#{rand(1..9)}"
            Code.dupe_check(rando)                
          
    end

    def self.display_code_info(hash)
        prompt = TTY::Prompt.new
        code_array = hash.to_a
        2.times{puts" "}
        puts"Here is your information for #{code_array[0][0].capitalize} #{code_array[0][1]}:"
        puts" "
        puts"#{code_array[0][0].upcase} #{code_array[0][1]}"
        puts"#{code_array[1][0].upcase}: #{code_array[1][1]}"
        puts" "
        more_info = prompt.select("Please chose your option:", ["See possible causes for #{code_array[0][0].capitalize} #{code_array[0][1]}? ","Return to Main Menu"])
        if more_info == "Return to Main Menu"
            CLI.start 
        else more_info == "Additional information on this code"
            2.times{puts" "}
            puts"Possible causes for #{code_array[0][0].capitalize} #{code_array[0][1]} (#{code_array[1][1]}) are:"
            puts"#{code_array[2][1].join(".  ")}."
            puts" "
            after_info = prompt.select("Please choose an option:", ["Return to Main Menu", "Exit"])
                if after_info == "Return to Main Menu" 
                    CLI.start
                else after_info == "Exit"
                    exit 
                end            
        end 
    end
end    



            
            

        

        
