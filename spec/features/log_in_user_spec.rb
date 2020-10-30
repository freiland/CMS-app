require 'rails_helper'

describe 'logs in a user to the app' do 
  it 'signs a user in' do
  visit projects_path
  fill_in 'Email', :with => 'testuser@email.com'
  fill_in 'Password', :with => 'password'
  click_on 'Log in'
  expect(page).to have_content('No projects') 
  end
end