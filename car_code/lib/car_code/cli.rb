require 'pry'
require 'tty-prompt'
require_relative 'code.rb'
require_relative 'api.rb'
prompt = TTY::Prompt.new
class CLI 
    @@code_class= 0 
    def call
        @@code_class = Code.new                           
        start                
    end

    def start
        prompt = TTY::Prompt.new
        5.times{puts" "}
        puts "             WELCOME TO CAR CODES"
        puts"            ======================"
        puts" " 
        puts"You can enter a specific car diagnostic code for information."
        puts" "
        puts"See information on a random code."
        puts" "
        puts"Exit."
        puts" "
        main_select = prompt.select("Please choose your option:", ["Enter a code", "Random code", "Exit"])
        if main_select == "Enter a code"
            enter_code
        elsif main_select == "Random code"
            puts"You entered 2, taking you to random Method" #placeholder
            choose_random 
        else main_select == "Exit"
            5.times{puts" "}
            puts"Thank you for using car codes!"
            5.times{puts" "}
            exit    
                      
        end      
    end    
 
    def enter_code
        prompt = TTY::Prompt.new
        puts "Please enter a valid 5 character diagnostic code (ex. P0001)."
        puts" "
        # input = gets.strip.upcase
        input = prompt.ask("Please enter your code:")
            
        puts input
        new_code=Api.fetch_codes(input)      
        Code.add_code(new_code) 
        puts"Here is the information for CODE"
        puts"Enter i for more information, or m for main menu"
        # input = gets.strip.downcase
        more_info = prompt.select("Please chose your option:", ["Additional information on this code","Return to Main Menu"])
        if more_info == "Return to Main Menu"
            start 
        else more_info == "Additional information on this code"
            puts"Here is your addidtional information."
            after_info = prompt.select("Please chose your option:", ["Return to Main Menu", "Exit"])
            # input = gets.strip.downcase
                if after_info == "Return to Main Menu" 
                    start 
                else after_info == "Exit"
                    exit 
                
                end
            end        
        end
    def choose_random 
            rando = "P000" + "#{rand(1..9)}"
            new_code=Api.fetch_codes(rando)      
            Code.add_code(new_code) 
    end


end    



            
            

        

        
