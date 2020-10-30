describe 'deletes a post from the app' do 
  it 'removes a post from the page' do 
    visit projects_path 
    fill_in 'Email', :with => 'testadmin@email.com'
    fill_in 'Password', :with => 'password'
    click_on 'Log in'

    click_on 'view posts'
    click_on 'add post'
    fill_in 'Subject', :with => 'Beirut'
    fill_in 'Content body', :with => 'dope'
    click_on 'Create Post'
    
    click_on 'Beirut'
    click_on 'Delete'
    expect(page).not_to have_content('Beirut')
  end
end