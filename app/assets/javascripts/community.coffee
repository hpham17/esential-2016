$ ->
  Dropzone.options.myZone = {
    accept: (file, done) ->
      done()
      $.post "/images?image[location]=#{file.name};image[community_id]=#{community_id}", (data) ->
        alert(data)
  };
  return
