require 'rails_helper'
include Warden::Test::Helpers
Warden.test_mode!

RSpec.describe "calendar", :type => :feature do 
  before(:each) do 
    @user = FactoryGirl.create(:user)
    login_as(@user, :scope => :user)
  end 

  it "has actual month name" do
    visit root_url
    expect(page).to have_content(Date.today.month)
  end

  it "leads to next month on click" do
  	visit root_url 
  	click_link ">"

  	expect(page).to have_content(Date.today.month + 1)
  end

  it "adds new event on calendar and shows events of all users in all-events-path" do 
    visit new_event_path 
  
    fill_in :event_name, with: "Monthly event"
    select '15', :from => "event[date(3i)]" 
    
    choose('event_repeat_30')
    

    click_button "Create Event"
    expect(page).to have_content("Monthly event")
 

    user2 = FactoryGirl.create(:user2)
    logout(:user)
    login_as(user2, :scope => :user)

    visit root_url
    expect(page).not_to have_content("Monthly event")

    click_link "All events"
    expect(page).to have_content("Monthly event")

    click_link "Monthly event"
    expect(current_path).to eq(all_path)
  end

end