$( document ).ready(function(){
	list()
  $("#refresh").click(function(){
  	list()
  })
});

list = function(){
  $.get('/spaces/list', function(spaces) {
	spaces.forEach(function(space) {
	  $("#spaces").append("<li>" + space.name + " " + space.description + " &pound" + space.price + " listed by " + space.user + "</li>")
	})
  })
}

