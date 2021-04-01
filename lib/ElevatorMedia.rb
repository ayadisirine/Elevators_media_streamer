#!/usr/bin/env ruby
require 'pry-byebug'
require 'uri'
require 'net/http'
require 'openssl'
require 'open-uri'
require 'json'


module ElevatorMedia
   class Streamer
      def initialize
         @jokes = {}
         puts "initialize test "
      end
   
      def APIConnect(url)
         # connect to the JOKE API 
            
         begin
            http = Net::HTTP.new(url.host, url.port)
            http.use_ssl = true
            http.verify_mode = OpenSSL::SSL::VERIFY_NONE
         
            request = Net::HTTP::Get.new(url)
            request["x-rapidapi-host"] = 'jokeapi-v2.p.rapidapi.com' 
            request["x-rapidapi-key"] = '6812dedfadmshd368a8943765d80p1ddf70jsnbb2d18b06af6' 

            response = http.request(request)
            json_response = JSON.parse(response.body)
            puts json_response
         rescue    
            #if response.code != "200" || json_response['results'] == 0
               return "Error : Bad Request"
            #end
         else
      
            json_response
         end 
      end
      

      #  GET CONTENT 
      #  Get, process, and deliver the content
      def getContent
         url = URI('https://jokeapi-v2.p.rapidapi.com/joke/Any')
         @jokes = self.APIConnect(url)
        
         output = 
            " <div  class=\"row alert alert-warning\">      
            <div class=\"col-md-2\">
            <br>
            </div><div class=\"col-md-6\">
            <h2 style=\"color:darkblue\">JOKE <br> 
             
            Joke:#{@jokes['setup']} 
            <h2 style=\"color:darkblue\">:)</h2></div></div>"
        puts output
         return output
      end

      #Get joke by type 
      def GetJokeByType(joketype)
         # connect to the JOKE API 
         url = URI('https://jokeapi-v2.p.rapidapi.com/joke/'+joketype)
      
         http = Net::HTTP.new(url.host, url.port)
         http.use_ssl = true
         http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      
         request = Net::HTTP::Get.new(url)
         request["x-rapidapi-host"] = 'jokeapi-v2.p.rapidapi.com' 
         request["x-rapidapi-key"] = '6812dedfadmshd368a8943765d80p1ddf70jsnbb2d18b06af6' 

         response = http.request(request)
         json_response = JSON.parse(response.body)
         puts json_response
         
         if response.code != "200" || json_response['results'] == 0
            return "Bad Request"
         end
         return json_response
     end


      
   end
end
