
require_relative 'code_store'
class Api

    def self.fetch_codes(input)
            puts"FETCHING!"                      
            urlf = "https://car-code.p.rapidapi.com/obd2/"
            urlf<<(input)
            url = URI(urlf)
            http = Net::HTTP.new(url.host, url.port)
            http.use_ssl = true
            http.verify_mode = OpenSSL::SSL::VERIFY_NONE

            request = Net::HTTP::Get.new(url)
            request["x-rapidapi-key"] = '29c1eeb39bmsh6898a4de96ee189p1c02ffjsnd00fb9948bcb'
            request["x-rapidapi-host"] = 'car-code.p.rapidapi.com'

            response = http.request(request)
            response.read_body
            result = JSON.parse(response.body)                      
            OBDCode.new(result)                       

               
    end   

end