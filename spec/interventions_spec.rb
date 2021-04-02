require 'rails_helper'
require 'spec_helper'


## TEST AUTHENTIFICATION PROCESS ##
###################################
RSpec.describe "Test authentification process before going to intervention page", :type => :feature do
    context "Going to the intervention page" do
        it "Access to the intervention page after authentification" do
            #Go to sign-in page 
            visit 'users/sign_in' 
            #Fill authentication parameters 
            fill_in 'user_email', with: 'nicolas.genest@codeboxx.biz'
            fill_in 'user_password', with: 'newdog1' do
                #After submit parameters go to the interventions page 
                visit '/interventions'
                #Check the content of the page; it should include Author text 
                expect(page).to have_text('Author')
            end 
        end
    end
end

## TEST ADD INTERVENTION PROCESS ##
###################################
RSpec.describe "Add intervention", :type => :feature do
    context "Fill intervention fields and submit" do
        it "Validate intervention submit" do
            visit 'users/sign_in' 
            fill_in 'user_email', with: 'nicolas.genest@codeboxx.biz'
            fill_in 'user_password', with: 'newdog1' do
                visit '/interventions'
                #Fill intervention fields and submit 
                fill_in 'employee', with: '3'
                fill_in 'customer', with: '4'
                fill_in 'report', with: 'Test of sirine' do 
                    #check that submit is well done : A pop up should be appeared which contains saved text 
                    expect(page).to have_text('saved')
                end
            end 
        end
    end
end


