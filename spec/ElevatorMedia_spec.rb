require "ElevatorMedia"

#block to group all your tests together & to tell RSpec which class you are testing.
RSpec.describe ElevatorMedia::Streamer do 

   describe ".getContent" do
      streamer = ElevatorMedia::Streamer.new
      context 'output type' do 
         it 'returns an HTML' do
            expect(streamer.getContent()).to be_kind_of String
         end
      end
      context 'put a STUB on APIConnect method ' do 
         it 'returns a joke' do
            streamer = ElevatorMedia::Streamer.new

            streamer.getContent()
            container = streamer.instance_variable_get('@jokes')
            expect(container['setup']).to be_kind_of String
         end
      end 
      context 'output type' do 
        it 'return another joke ' do
           expect(streamer.getContent()).to be_kind_of String
        end
     end  
   end
   
end