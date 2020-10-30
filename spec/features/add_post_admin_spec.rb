require 'rails_helper'

describe 'publishes a new post' do 
  it 'admin adds a new post to app' do 

    visit projects_path 
    fill_in 'Email', :with => 'testadmin@email.com'
    fill_in 'Password', :with => 'password'
    click_on 'Log in'
    expect(page).to have_content 'No projects'


    click_on 'view posts'
    click_on 'add post'
    fill_in 'Subject', :with => 'Beirut'
    fill_in 'Content body', :with => 'dope'
    click_on 'Create Post'
    expect(page).to have_content('Beirut')
  end
end