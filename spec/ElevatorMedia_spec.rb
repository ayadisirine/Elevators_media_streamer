require 'rails_helper'
require 'spec_helper'
require 'ElevatorMedia'


describe ElevatorMedia::Streamer do
    describe "content test " do 
        let!(:streamer){ElevatorMedia::Streamer.new}


        # Testing if the required getContent method returns "interesting content"
        it "should receive data from getContent" do
            expect(streamer).to respond_to(:getContent)  
        end      
    end
end