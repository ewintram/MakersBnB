$( document ).ready(function(){
	list()
  $("#refresh").click(function(){
  	list()
  })
});

list = function(){
  $.get('/spaces/list', function(spaces) {
	spaces.forEach(function(space) {
	  $("#spaces").append("<li><a href='/spaces/" + space.id + "'>" + space.name + " " + space.description +
		" &pound" + space.price + " listed by " + space.user + "</a></li>")
	})
  })
}

// filter = function(criterion){
// 	$.get('/spaces/list', function(spaces) {
// 	spaces.forEach(function(space) {
// 		if(criterion[space.criterion[0]] === space.id){
// 			$("#spaces").append("<li><a href='/spaces/" + space.id + "'>" + space.name + " " + space.description +
// 			" &pound" + space.price + " listed by " + space.user + "</a></li>")
// 		}
// 	})
//   })
//
// }
