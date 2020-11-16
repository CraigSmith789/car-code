

class Api

  def self.fetch_codes(input)
                               
    urlf = "https://car-code.p.rapidapi.com/obd2/"
    urlf<<(input)
    url = URI(urlf)
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    request["x-rapidapi-key"] = #/ WILL NEED A KEY TO RUN
    request["x-rapidapi-host"] = 'car-code.p.rapidapi.com'

    response = http.request(request)
    response.read_body
    result = JSON.parse(response.body)                      
    OBDCode.new(result)                       

               
  end   

end