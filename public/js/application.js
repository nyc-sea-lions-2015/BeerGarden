$(document).ready(function() {
   $('#add_comment').on('click', function(event){
    event.preventDefault();
    $target = $(event.target);
    $target.hide();
    var url = $target.attr('href');
    $.ajax({
      method: 'get',
      url: url,
      }).done(function(response){
        $('#comments').append(response);
      });
  });

  $('#comments').on('submit', '#new_comment', function(event){
    event.preventDefault();
    $target = $(event.target);
    var url = $target.attr('action');
    var data = $target.serialize();
    $.ajax({
      method: "post",
      url: url,
      data: data,
    }).done(function(response){
      //TODO: FIX - appends to last comment without bullet; only works for first comment
      $('#comments ul').append('<li>' + response + '</li>');
    });
  });
});
