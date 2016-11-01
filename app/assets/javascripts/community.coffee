$ ->
  myDropzone = new Dropzone("form#myZone", { url: "/upload", addRemoveLinks: true });
  myDropzone.on 'addedfile', (file) ->
    # $.post '/images/create', {location: file, community_id: current_user.community.id}
    return
  return
