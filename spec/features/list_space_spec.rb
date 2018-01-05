feature("test framework functioning") do
  scenario("shows the page title") do
    visit '/spaces'
    expect(page).to have_content("Makersbnb")
  end
end

feature("list spaces") do
  scenario("spaces listed by user remain on the user's 'my spaces' page") do
    sign_up
    create_space
    sign_up(email: 'test2@test.org.uk', password: 'passyword2', password_confirm: 'passyword2', username: 'tester2', first_name: 'Tester2', last_name: 'MacTesterford2')
    create_space_2

    visit '/spaces/my-spaces'
    expect(page).not_to have_content("My house")
    expect(page).not_to have_content("Nice crib. It's rad")
    expect(page).not_to have_content("£2.00")

    expect(page).to have_content("My flat")
    expect(page).to have_content("Great view")
    expect(page).to have_content("£5.00")
  end
end
