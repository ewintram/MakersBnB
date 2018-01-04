require_relative 'user_access_helpers'

feature("test framework functioning") do
  scenario("shows the page title") do
    visit '/spaces'
    expect(page).to have_content("Makersbnb")
  end
end

feature("list spaces") do
  scenario("user can add name, description and price for a space", js: true) do
    sign_up
    create_space

    expect(current_path).to eq("/spaces")
    expect(page).to have_content("My house")
    expect(page).to have_content("Nice crib. It's rad")
    expect(page).to have_content("£2.00")
  end
end
