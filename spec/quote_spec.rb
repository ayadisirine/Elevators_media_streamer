require 'rails_helper'
require 'spec_helper'

#Test quotes controller response 
RSpec.describe "QuotesController", :type => :controller do
    #Declare quotes 
    let!(:quotes){Quote.new}
    # Testing if the Quotes controller returns a succesful HTTP response
    it"waiting for success code :200" do
        expect(@response.status).to eq (200)
    end
    # the quotes controller returns success 
    #show quote object
  
    it "if success show quote object" do
        expect(@response.status).to eq (200)
        #check quotes object
        expect(quotes).to_not eq(nil)
        puts quotes
    end
end

#Test the content of the quotes page 
RSpec.describe "quotes", :type => :feature do
    # context 
    context "Going to the quote page" do
        it "check quotes page" do
            visit "pages/quote"
            #check the quotes content  
            expect(page).to have_text('Steps to a Quote Request')
        end
    end
end



