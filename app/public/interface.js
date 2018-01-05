$( document ).ready(function(){
  $("#refresh").click(function(){
  	list()
  })

  $("#view_bookings").click(function(){
    $("#bookings").show();
  });

  $("#hide_bookings").click(function(){
    $("#bookings").hide();
  });
});

list = function(filter= 'nil'){
  $.get('/spaces/list/'+ filter, function(spaces) {
	spaces.forEach(function(space) {
	  $("#spaces").append("<li><a id='space_id' href='/spaces/" + space.id + "'>" + space.name + "</a> " + space.description +
		" &pound" + space.price + " listed by " + space.user + "</li>")
	})
  })
}
