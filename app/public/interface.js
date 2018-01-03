$( document ).ready(function(){
	list()
  $("#interface").click(function(){
  	list()
  })
});

list = function(name, description, price){
  $.get('/spaces/list', function(spaces) {
  	console.log(spaces);
	spaces.forEach(function(space) {
		console.log(space.name)
	  $("#spaces").append("<li>" + space.name + " " + space.description + " &pound" + space.price + " posted by " + space.user + "</li>")
	})
  })
}

