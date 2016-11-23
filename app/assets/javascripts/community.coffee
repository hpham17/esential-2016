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
  $('select').material_select();
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
        i++
      $('input.autocomplete').autocomplete data: address
  });
  $('#get-codes').click ->
    $.ajax({
      url: "http://cors.io?http://www.zipcodeapi.com/rest/KQQyVg4np8XZgwEzzA1Gdnt2z8Atq5jbWaKSqPfPXdOeJtNj4P0hctkMBUg20zdW/radius.json/#{zip}/#{radius}/mile?minimal"
      success: (data) ->
        $.ajax({
          url: '/zipcodes'
          data: {zipcodes: JSON.parse(data).zip_codes}
          success: (data) ->
            alert(JSON.stringify(data))
            # address = {}
            # i = 0
            # while i < data.length
            #   address[data[i].name] = null
            #   address[data[i].address] = null
            #   i++
            # $('input.autocomplete').autocomplete data: address
        });
    });

  return
