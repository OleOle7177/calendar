require 'rails_helper'
include Warden::Test::Helpers
Warden.test_mode!

RSpec.describe Event, :type => :feature do 
 before(:each) do 
    @user = FactoryGirl.create(:user)
    login_as(@user, :scope => :user)
  end  
  
#  it "destroys all user events when he cancel his account", :js => true do 
#   visit new_event_path 
#  
#   fill_in :event_name, with: "Monthly event"
#   select '15', :from => "event[date(3i)]" 
    
#   choose('event_repeat_30')
#   click_button "Create Event"

#   click_link @user.name
#   click_button "Cancel my account"
#   page.accept_alert

#   expect(Event.where(user_id: @user.id).count).to eq(0)
# end


end