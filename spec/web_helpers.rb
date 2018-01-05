def sign_up(email: 'test@test.org.uk', password: 'passyword', password_confirm: 'passyword', username: 'tester', first_name: 'Tester', last_name: 'MacTesterford')
  visit '/users/new'
  within("#signupform") do
    fill_in 'email', with: email
    fill_in 'password', with: password
    fill_in 'password_confirm', with: password_confirm
    fill_in 'username', with: username
    fill_in 'first_name', with: first_name
    fill_in 'last_name', with: last_name
    click_button 'Sign up'
  end
end

def sign_up_2(email: 'test2@test.org.uk', password: 'passyword2', password_confirm: 'passyword2', username: 'tester2', first_name: 'Tester2', last_name: 'MacTesterford2')
  visit '/users/new'
  within("#signupform") do
    fill_in 'email', with: email
    fill_in 'password', with: password
    fill_in 'password_confirm', with: password_confirm
    fill_in 'username', with: username
    fill_in 'first_name', with: first_name
    fill_in 'last_name', with: last_name
    click_button 'Sign up'
  end
end

def sign_in(username: 'tester', password: 'passyword')
  visit '/spaces'
  fill_in 'username', with: username
  fill_in 'password', with: password
  click_button 'Log in'
end

def sign_out
  visit '/spaces'
  click_button 'Log out'
end

def create_space
  visit '/spaces/my-spaces/new'
  fill_in :name, with: "My house"
  fill_in :description, with: "Nice crib. It's rad"
  fill_in :price, with: 2
  click_button :submit_space
end

def create_space_2
  visit '/spaces/my-spaces/new'
  fill_in :name, with: "My flat"
  fill_in :description, with: "Great view"
  fill_in :price, with: 5
  click_button :submit_space
end

def book
  visit '/spaces'
  click_on 'My house'
  fill_in 'from', with: '2018-04-12'
  fill_in 'to', with: '2018-04-15'
  click_on 'Submit Booking Request' 
end
