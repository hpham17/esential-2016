class Address < ActiveRecord::Base
  belongs_to :community
  def format
    return "#{house_number} #{street} #{state}, #{zip}"
  end

end
