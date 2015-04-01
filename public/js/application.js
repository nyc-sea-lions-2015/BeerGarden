$(document).ready(function() {
   $('#add_comment').on('click', function(event){
    event.preventDefault();
    $(this).hide();
    var url = $(this).attr('href');
    $.get(url, function(
      serverResponse, status, request){
      $('#comments').append(serverResponse)
    })
   })
});
