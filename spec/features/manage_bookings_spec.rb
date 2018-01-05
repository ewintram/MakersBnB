feature "Bookings" do 
  scenario "user creates a booking for a space" do
  	sign_up
  	create_space
  	expect { book }.to change { Booking.count }.by 1
  	expect(current_path).to eq('/bookings')
  end
end