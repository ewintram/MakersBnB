class Space
  include DataMapper::Resource

  property :id, Serial
  property :name, String, required: true
  property :description, Text
  property :price, Float, required: true

  has n, :bookings, through: Resource

  belongs_to :user

end
