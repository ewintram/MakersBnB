class Booking
  include DataMapper::Resource

  property :id, Serial
  property :confirmed, Boolean
  property :date_range, DateTime

  belongs_to :user
  belongs_to :space

end
