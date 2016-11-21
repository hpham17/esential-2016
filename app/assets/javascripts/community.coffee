$ ->
  Dropzone.options.myZone = {
    accept: (file, done) ->
      done()
      $.post "/images?image[location]=#{file.name};image[community_id]=#{community_id}", (data) ->
        alert(data)
  };
  distance = 0
  radius = 1
  zip = 0
  $('#zip').change ->
    zip = $('#zip').val()
  $('#radius').change ->
    radius = $('#radius option:selected').text()
  $('#get-codes').click ->
    $.ajax({
      url: "http://cors.io/?https://www.zipcodeapi.com/rest/KQQyVg4np8XZgwEzzA1Gdnt2z8Atq5jbWaKSqPfPXdOeJtNj4P0hctkMBUg20zdW/radius.json/#{zip}/#{radius}/mile?minimal"
      success: (data) ->
        $.get '/dashboard', { zipcodes: JSON.parse(data).zip_codes }
    });

  return
