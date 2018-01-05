class Booking
  include DataMapper::Resource

  property :id, Serial
  property :confirmed, Boolean
  property :start_date, Date
  property :end_date, Date

  belongs_to :user
  belongs_to :space

end
