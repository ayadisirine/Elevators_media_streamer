
require 'rest-client'
require 'rails_helper'
require 'unirest'

module ElevatorMedia
  class Streamer

      # Media content will be displayed as HTML in the company's elevators
      def getContent()

        response = Unirest.GET ENV['JOKE_URL'],
          headers:{
            "X-RapidAPI-Key" => ENV['JOKE_KEY'],
            "Content-Type" => "application/x-www-form-urlencoded"
          },
          parameters:{
            "parameter" => "value"
          }
        
        response.code # Status code
        response.headers # Response headers
        response.body # Parsed body
        response.raw_body # Unparsed body

        console.log(response.body);

      end
    end
end