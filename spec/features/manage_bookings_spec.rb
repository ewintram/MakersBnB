feature "Bookings" do
  scenario "user creates a booking for a space" do
  	sign_up
  	create_space
  	expect { book }.to change { Booking.count }.by 1
  	expect(current_path).to eq('/bookings')
  end

  scenario "users can see all their bookings" do
    sign_up
  	create_space
    book
    visit ("/bookings")
    expect(page).to have_content "Check-in date: 2018-04-12"
  end

end
