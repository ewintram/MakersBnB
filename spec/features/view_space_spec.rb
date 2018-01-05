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

  scenario("user can navigate back to 'my spaces'") do
    sign_up
    create_space
    click_on "My spaces"
    expect(current_path).to eq("/spaces/my-spaces")
  end
end

feature("create new spaces") do
  scenario("logged in user can navigate to create new space from this page") do
    sign_up
    click_on "Create a space"
    expect(current_path).to eq("/spaces/my-spaces/new")
  end

  scenario("logged in user can navigate to create new space from this page") do
    sign_up
    visit '/spaces/my-spaces'
    click_on "Create a space"
    expect(current_path).to eq("/spaces/my-spaces/new")
  end
end
