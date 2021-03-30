require "ElevatorMedia"


 
RSpec.describe ElevatorMedia::Streamer do 

   describe ".getContent" do
      streamer = ElevatorMedia::Streamer.new
      context 'output type' do 
         it 'returns an HTML' do
            expect(streamer.getContent()).to be_kind_of String
         end
      end
      context 'put a STUB on APIConnect method ' do 
         it 'returns a predefined Hash' do
            streamer = ElevatorMedia::Streamer.new

            streamer.getContent()
            container = streamer.instance_variable_get('@jokes')
            expect(container['response'][0]).to be_kind_of String
         end
      end   
   end
   
end