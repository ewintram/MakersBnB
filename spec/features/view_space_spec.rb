require_relative 'user_access_helpers'

feature("view a space") do
  scenario("shows the information about the space") do
    sign_up
    create_space
    visit '/spaces'
    within("ul") do
      click_link ("My house")
    end
    expect(current_path).to eq("/spaces/1")
    expect(page).to have_content("My house")
    expect(page).to have_content("Nice crib. It's rad")
    expect(page).to have_content("£2.00")
  end
end
