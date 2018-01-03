def sign_up(email: 'test@test.org.uk', password: 'passyword', password_confirm: 'passyword', username: 'tester', first_name: 'Tester', last_name: 'MacTesterford')
  visit '/users/new'
  fill_in 'email', with: email
  fill_in 'password', with: password
  fill_in 'password_confirm', with: password_confirm
  fill_in 'username', with: username
  fill_in 'first_name', with: first_name
  fill_in 'last_name', with: last_name
  click_button 'Sign up'
end

def sign_in(email: 'test@test.org.uk', password: 'passyword')
  visit '/spaces'
  fill_in 'username', with: username
  fill_in 'password', with: password
  click_button 'Log in'
end

def sign_out
  visit '/spaces'
  click_button 'Log out'
end
