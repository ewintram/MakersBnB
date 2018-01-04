$( document ).ready(function(){
  $("#refresh").click(function(){
  	list()
  })
});

list = function(filter= 'nil'){ 
  $.get('/spaces/list/'+ filter, function(spaces) {
	spaces.forEach(function(space) {
	  $("#spaces").append("<li><a id='space_id' href='/spaces/" + space.id + "'>" + space.name + "</a> " + space.description +
		" &pound" + space.price + " listed by " + space.user + "</li>")
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
