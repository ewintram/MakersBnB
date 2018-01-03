feature("test framework functioning") do
  scenario("shows the page title") do
    visit '/'
    expect(page).to have_content("Makersbnb")
  end
end

feature("list spaces") do
  scenario("user can add name, description and price for a space", js: true) do

    visit '/spaces/new'
    fill_in :name, with: "My house"
    fill_in :description, with: "Nice crib. It's rad"
    fill_in :price, with: 2
    click_button :submit_space

    expect(current_path).to eq("/spaces")
    expect(page).to have_content("My house")
    expect(page).to have_content("Nice crib. It's rad")
    expect(page).to have_content("£2")
  end
end
