#alert 'success!'
$('.progress.progress-striped.active').hide()
$('form#new_video').hide()
$("<%=j render 'video_uploaded' %>").appendTo('#main')
if remotipart_submitted?
  alert('submitted via remotipart')
else
  alert('submitted via native jquery-ujs')
