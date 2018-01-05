$( document ).ready(function(){
  $("#refresh").click(function(){
  	list()
  })

  for (i=0; i < $('li').length; i++){

  $("#view_bookings-"+i).click(function(output){
  	viewbookings(($(this).attr('id').split('-'))[1])
  });

  $("#hide_bookings-" + i).click(function(){
    hidebookings(($(this).attr('id').split('-'))[1])
  });
};
});

viewbookings = function(index){
  $("#bookings-"+index).show();
  $("#view_bookings-" + index).hide();
  $("#hide_bookings-" + index).show();
}

hidebookings = function(index){
  $("#bookings-" + index).hide();
  $("#view_bookings-" + index).show();
  $("#hide_bookings-" + index).hide();
}

list = function(filter= 'nil'){
  $.get('/spaces/list/'+ filter, function(spaces) {
	spaces.forEach(function(space) {
	  $("#spaces").append("<li><a id='space_id' href='/spaces/" + space.id + "'>" + space.name + "</a> " + space.description +
		" &pound" + space.price + " listed by " + space.user + "</li>")
	})
  })
}
