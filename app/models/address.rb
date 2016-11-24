class Address < ActiveRecord::Base
  belongs_to :community
  def format
    return "#{house_number} #{street} #{state}, #{zip}"
  end
  # Geocoding the address
  geocoded_by :address,
    :latitude  => :fetched_latitude,  
    :longitude => :fetched_longitude  
  after_validation :geocode, if: ->(obj){ obj.address.present? }#{ obj.address.present? and obj.address_changed? }
  #geocoded_by :address
  #geocoded_by :full_address
  #geocoded_by :address, latitude: :lat, longitude: :lon
  #after_validation :geocode
  # reverse_geocoded_by :latitude, :longitude do |obj, results|
    #     if geo = results.first
    #         obj.city    = geo.city
    #         obj.zipcode = geo.postal_code
    #         obj.country = geo.country_code
    #     end
    # end
  # geocoded_by :address,
  #   :latitude  => :fetched_latitude,  
  #   :longitude => :fetched_longitude  
  # after_validation :geocode, if: ->(obj){ obj.address.present? }#{ obj.address.present? and obj.address_changed? }
  # gon.latitude = obj.latitude
  # gon.longtitude = obj.longitude
  #after_validation :geocode, if: ->(obj){ obj.address.present? }#{ obj.address.present? and obj.address_changed? }
  # after_validation :reverse_geocode, unless: ->(obj) { obj.address.present? },
  #               if: ->(obj){ obj.latitude.present? and obj.latitude_changed? and obj.longitude.present? and obj.longitude_changed? }
  # def full_address
  #     [country, city, street].compact.join(‘, ‘)
  # end
  
end
