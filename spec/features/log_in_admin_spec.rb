require 'rails_helper'

describe 'logs in a new administrator' do 
  it 'signs in a new admin' do 
    visit projects_path 
    fill_in 'Email', :with => 'testadmin@email.com'
    fill_in 'Password', :with => 'password'
    click_on 'Log in'
    expect(page). to have_content 'No projects'
  end 
end