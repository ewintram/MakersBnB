class Range

  def overlaps?(other)
  cover?(other.first) || other.cover?(first)
  end
end

class Space
  include DataMapper::Resource

  property :id, Serial
  property :name, String, required: true
  property :description, Text
  property :price, Float, required: true

  has n, :bookings

  belongs_to :user

def is_available?(dates)
  bookings.each do |booking|
    return false if (booking.start_date..booking.end_date).overlaps?(dates) == true
  end
  true
end
end
