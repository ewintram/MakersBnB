$( document ).ready(function(){
  $('#submit_space').click(function(){
    list($("#name").val());
})
});

list = function(name){
  $("#spaces").html("<li>" + name + "</li>")
}
