require_relative 'user_access_helpers' 

feature "Signing up" do
  scenario "user signs up" do
  	sign_up 
  	expect(page).to have_content "Welcome Tester"
  end
end
