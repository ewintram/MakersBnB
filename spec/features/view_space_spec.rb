require_relative 'user_access_helpers'

feature("view a space") do
  scenario("shows the information about the space") do
    sign_up
    create_space
    click_on ("My house")
    expect(current_path).not_to eq("/spaces")
    expect(page).to have_content("My house")
    expect(page).to have_content("Nice crib. It's rad")
    expect(page).to have_content("£2.00")
  end
end
