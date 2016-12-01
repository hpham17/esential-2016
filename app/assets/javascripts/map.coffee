markersArray = []
inactive = false
QUERY_DELAY = 400;
jQuery ->
  window.initMap = ->
    map = new google.maps.Map document.getElementById('map'), {
      center: {lat: 37.871933, lng: -122.258583}
      zoom: 14
    }
    search map


###*
# Makes a post request to the server with the search term and
# populates the map with the response businesses
#
# param: map - the Google map object
###

search = (map) ->
  if inactive == true
    return
  # post to the search with the search term, take the response data
  # and process it
  $.get '/communities', {format: 'json'}, (data) ->
    inactive = true
    # do some clean up
    $('#results').show()
    $('#results').empty()
    clearMarkers()
    # iterate through each business in the response capture the data
    # within a closure.
    i = 0
    while i < data.length
      capture i, map, data[i]
      i++
    return
  return

###*
# Capture the specific business objects within a closure for setTimeout
# or else it'll execute only on the last business in the array
#
# param: i - the index the business was at in the array, used to the
#            timeout delay
# param: map - the Google map object used for geocoding and marker placement
# param: business - the business object from the response
###

capture = (i, map, community) ->
  setTimeout (->
    if i == 15
      inactive = false

    # get the geocoded address for the business's location
    geocode_address map, community['name'], community['address'], community, i
    return
  ), QUERY_DELAY * i
  # the delay on the timeout
  return

###*
# Builds the div that'll display the business result from the API
#
# param: business - object of the business response
###

build_results_container = (community, i) ->
  [
    "<div class='result'>",
    "  <h5><a id='#{community['name']}' href='/communities/#{i+1}'>",
      community['name'],
    "    </a></h5>",
    "  <p>",
    community['address'],
    "</p>",
    "</div>"
  ].join("\n");


###*
# Geocode the address from the business and drop a marker on it's
# location on the map
#
# param: map - the Google map object to drop a marker on
# param: name - the name of the business, used for when you hover
#               over the dropped marker
# param: location_object - an object of the businesses address
###

geocode_address = (map, name, address, community, i) ->
  geocoder = new (google.maps.Geocoder)
  # geocode the address and get the lat/lng
  geocoder.geocode { address: address }, (results, status) ->
    if status == google.maps.GeocoderStatus.OK
      # create a marker and drop it on the name on the geocoded location
      marker = new google.maps.Marker {
        animation: google.maps.Animation.DROP,
        map: map,
        position: results[0].geometry.location,
        title: name,
        optimized: false
      }
      myoverlay = new google.maps.OverlayView()
      myoverlay.draw = ->
        this.getPanes().markerLayer.id = 'markers'
        return
      myoverlay.setMap map
      infowindow = new (google.maps.InfoWindow)(content: build_results_container(community, i))
      marker.addListener 'click', ->
        infowindow.open map, marker
        return
      # save the marker object so we can delete it later
      markersArray.push marker
    else
      console.log 'Geocode was not successful for the following reason: ' + status
    return
  return

###*
# Remove all of the markers from the map by setting them
# to null
###

clearMarkers = ->
  markersArray.forEach (marker) ->
    marker.setMap null
    return
  markersArray = []
  return
