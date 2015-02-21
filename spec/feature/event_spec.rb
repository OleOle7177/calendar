require 'rails_helper'


RSpec.describe Event, :type => :feature do  
  
  it "shows new event after create" do 
  	visit new_event_path
  	fill_in "Name", with: "New super event"
   	click_button "Create"
  	expect(page).to have_content("New super event")
  end

  it "edits all connected events in calendar" do 
  	event = FactoryGirl.create(:event, date: Date.today)
  	visit edit_event_path(event)
  	fill_in "Name", with: "Mega event"
  	click_button "Update"
  	expect(page).to have_content("Mega event")
  	expect(page).not_to have_content(event.name)
  end
end