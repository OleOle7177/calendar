require 'rails_helper'
include Warden::Test::Helpers
Warden.test_mode!

RSpec.describe Event, :type => :feature do 
 before(:each) do 
    @user = FactoryGirl.create(:user)
    login_as(@user, :scope => :user)
  end  
  
  it "shows new event after create and update all connected events" do 
  	visit new_event_path
   
  	fill_in :event_name, with: "New super event"
    choose('event_repeat_1')

    click_button "Create Event"
  	expect(page).to have_content("New super event")  

    print page.html
    within(".today") do 
  	   click_link "New super event"
    end
  
  	fill_in :event_name, with: "Mega event"
  	click_button "Update"
  	expect(page).to have_content("Mega event")
  	expect(page).not_to have_content("New super event")
  end

end