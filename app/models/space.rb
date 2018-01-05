class Space
  include DataMapper::Resource

  property :id, Serial
  property :name, String, required: true
  property :description, Text
  property :price, Float, required: true

  has n, :bookings

  belongs_to :user

end
