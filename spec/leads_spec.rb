require 'rails_helper'
require 'spec_helper'

RSpec.describe "LeadsController", :type => :controller do
    #create lead instance 
    let!(:led){Lead.new}
    # Test Lead controller return
    it"Waiting Http Reponse = 200" do
        expect(@response.status).to eq (200)
    end
    # Testing Lead content 
    
    it "Testing Lead object  " do
        expect(@response.status).to eq (200)
        expect(led).to_not eq(nil)
        #Show Lead object 
        puts Lead
    end
end