class Address < ActiveRecord::Base
  belongs_to :community
  def format
    return "#{house_number} #{street} #{state}, #{zip}"
  end

  def distance_between(a,b)
    distance = 0
    $.ajax
      url: "https://www.zipcodeapi.com/rest/#{ZIPCODE_APIKEY}/distance.json/#{a}/#{b}/mile"
      success: (data) ->
        distance = data.distance
    return distance
  end
end
