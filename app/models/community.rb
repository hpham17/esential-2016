class Community < ActiveRecord::Base
  has_one :address
  belongs_to :user
  has_many :images
  has_many :loan_requests
  accepts_nested_attributes_for :images
  def as_json(options={})
    { :name => self.name, :address => self.address.format  }
  end
  # Gecoding address location
  geocoded_by :address
  #geocoded_by :full_address
  #geocoded_by :address, latitude: :lat, longitude: :lon
  after_validation :geocode
  reverse_geocoded_by :latitude, :longitude do |obj, results|
        if geo = results.first
            obj.city    = geo.city
            obj.zipcode = geo.postal_code
            obj.country = geo.country_code
        end
    end

  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }
  after_validation :reverse_geocode, unless: ->(obj) { obj.address.present? },
                 if: ->(obj){ obj.latitude.present? and obj.latitude_changed? and obj.longitude.present? and obj.longitude_changed? }
  def full_address
      [country, city, street].compact.join(‘, ‘)
  end
  
end
