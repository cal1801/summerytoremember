class Address < ActiveRecord::Base
  geocoded_by :full_address, :latitude => :lat, :longitude => :lon
  after_validation :geocode, :if => :address_changed?
  belongs_to :camp

  def full_address
    [address, address2, city, state, zip].compact.join(', ')
  end
end
