require_relative 'code_store'
class CLI 
     
  def call                                   
    CLI.start                
  end

  def self.start
    5.times{puts" "}
    puts "             WELCOME TO CAR CODES"
    puts"            ======================"
    puts" " 
    puts"OBD-II PIDs (On-board diagnostics Parameter IDs) are codes used to request data from a vehicle, used as a diagnostic tool."
    puts" "
    puts"Please select one of the options below to either see information on a specific code."
    puts" "
    puts"Or, select Random Code to see information on a random OBD code!."
    puts" "
    prompt = TTY::Prompt.new
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
    puts "Please enter a valid 5 character diagnostic code (ex. P0001)."
    puts" "
    prompt = TTY::Prompt.new
    input = prompt.ask("Please enter your code:") 
    input = "#{input}".upcase
    if input[0].chr == ("P" or "B" or "C" or "U") && input.length == 5 && input =~/\D\d\d\d\d/ 
        disp_code = OBDCode.get_obdc(input)
        display_code_info(disp_code)

    else self.enter_code 
    end            
                                    
  end           
            
                  
    
  def self.choose_random            
    rando = "P000" + "#{rand(1..9)}"
    disp_code = OBDCode.get_obdc(rando)
    display_code_info(disp_code)                
          
  end

  def self.display_code_info(disp_code)
    2.times{puts" "}
    puts"Here is your information for Code #{disp_code.code}:"
    puts" "
    puts"CODE #{disp_code.code}"
    puts"DESCRIPTION: #{disp_code.definition}"
    puts" "
    prompt = TTY::Prompt.new
    more_info = prompt.select("Please chose your option:", ["See possible causes for CODE #{disp_code.code}? ","Return to Main Menu"])
    if more_info == "Return to Main Menu"
        CLI.start 
    else more_info == "Additional information on this code"
        2.times{puts" "}
        puts"Possible causes for Code #{disp_code.code} are:"
        puts"#{disp_code.cause.join(", ")}."
        puts" "

        after_info = prompt.select("Please choose an option:", ["Return to Main Menu", "Exit"])
            if after_info == "Return to Main Menu" 
                CLI.start
            else after_info == "Exit"
                5.times{puts" "}
                puts"Thank you for using car codes!"
                5.times{puts" "}
                exit    
                 
            end            
        end 
    end
end    



            
            

        

        
