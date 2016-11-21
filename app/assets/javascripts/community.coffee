$ ->
  Dropzone.options.myZone = {
    accept: (file, done) ->
      done()
      $.post "/images?image[location]=#{file.name};image[community_id]=#{community_id}", (data) ->
        alert(data)
  };
  $('.item2').click (e) ->
    e.preventDefault()
    $('#modal-2').modal
      backdrop: false
      keyboard: false
    return
  distance = 0
  radius = 1
  zip = 0
  $('#zip').change ->
    zip = $('#zip').val()
  $('#radius').change ->
    radius = $('#radius option:selected').text()
  $('#get-codes').click ->
    $.ajax({
      url: "https://www.zipcodeapi.com/rest/js-axPSJBhg32E7qBzHzCpi72pQpqdX0AFb8v3S7k8anNhNoQuYtUgAWGqm6Ek7e0jn/radius.json/#{zip}/#{radius}/mile?minimal"
      success: (data) ->
        alert(data)
        $.get '/dashboard', { zipcodes: JSON.parse(data).zip_codes }
    });

  return
