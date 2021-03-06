require "ElevatorMedia"
require 'rails-html-sanitizer'

#block to group all your tests together & to tell RSpec which class you are testing.
RSpec.describe ElevatorMedia::Streamer do 
    
   describe ".getContent" do
      streamer = ElevatorMedia::Streamer.new
        ##############################################################################
        #First test : check that connection is established and some string is returned 
        context 'on APIConnect method ' do 
            #Expected return 
            it 'returns a joke' do
                #Create streamer object 
                streamer = ElevatorMedia::Streamer.new
                #Call getContent method 
                streamer.getContent()
                #get jokes object 
                container = streamer.instance_variable_get('@jokes')
                #RETURNED JSON #
                ################
                #{9 items "error":false "category":"Programming" "type":"twopart" "setup":"Why do programmers wear glasses?" 
                #"delivery":"Because they need to C#" "flags":{6 items "nsfw":false "religious":false "political":false "racist":false
                #"sexist":false "explicit":false } "id":50 "safe":true "lang":"en" }
                ##################
                # check that the joke exists and it is a string 
                expect(container['setup']).to be_kind_of (String)
            end
        end 
        ##############################################################################

        ##############################################################################
        #Second test : Check that getContent return HTML 
        context 'output type' do 
            # Expected return 
            it 'returns an HTML' do
                text = streamer.getContent()
               
                #Make the test 
                full_sanitizer = Rails::Html::FullSanitizer.new
                expect(full_sanitizer.sanitize(text).eql?  (text))
            end
        end



        ##############################################################################
        #Third test : Check when wrong API URL  
        context 'wrong API URL' do 
            # Expected return 
            it 'returns an exception error' do
                streamer2 = ElevatorMedia::Streamer.new
                url = URI('https://www.google.com')
                @json_r = streamer2.APIConnect(url)
               
                #Make the test 
                
                expect(@json_r.include? "Error")
            end
        end



        #Fourth test : Check joke type L 
        context 'joke type' do 
            # Expected return 
            it 'returns required joke type' do
                text = streamer.GetJokeByType("Programming")
               
                #Make the test 
                container = streamer.instance_variable_get('@jokes')
                #RETURNED JSON #

                expect(container['type'].eql? "Programming")

                

                
            end
        end


   end
   
end