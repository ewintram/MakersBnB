class Booking
  include DataMapper::Resource

  property :id, Serial
  property :confirmed, Boolean
  property :Dates

  has n, :users, through: Resource
  has n, :spaces, through: Resource

end