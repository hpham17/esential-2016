$ ->
  Dropzone.options.myZone = {
    thumbnailWidth: 300,
    thumbnailHeight: 263,
    accept: (file, done) ->
      $.post "/images?image[location]=#{file.name}", (data) ->
        alert(data)
        return
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
  $.ajax({
    url: '/communities'
    data: {format: 'json'}
    success: (data) ->
      address = {}
      i = 0
      while i < data.length
        address[data[i].name] = null
        address[data[i].address] = null
        address[data[i].zipcode] = null
        i++
      $('input.autocomplete').autocomplete data: address
  });
  return
