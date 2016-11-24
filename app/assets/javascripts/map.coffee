jQuery ->
  window.initMap = ->
    if $('#map').size() > 0
      map = new google.maps.Map document.getElementById('map'), {
        center: {lat: 37.871933, lng: -122.258583}
        zoom: 10
      }
      marker = new google.maps.Marker({
          position: {lat: 37.871933, lng: -122.258583}
          map: map
      })
      marker = new google.maps.Marker({
          position: {lat: 37.77, lng: -122.41}
          map: map
      })
      marker = new google.maps.Marker({
          position: {lat: gon.latitude, lng: gon.longitude}
          map: map
      })
      
      