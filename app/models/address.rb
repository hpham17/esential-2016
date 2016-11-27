class Address < ActiveRecord::Base
  belongs_to :community
  validates :house_number, :street, :city, :state, :zip, presence: true
  validates :house_number, :zip, numericality: { only_integer: true }
  def format
    return "#{house_number} #{street} #{city} #{state}, #{zip}"
  end
end
