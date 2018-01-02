$( document ).ready(function(){
  $('#submit_space').click(function(){
    list($("#name").val(), $("#description").val(), $("#price").val());
    $("#name").val("")
    $("#description").val("")
    $("#price").val("")
})
});

list = function(name, description, price){
  $("#spaces").append("<li>" + name + " " + description + " &pound" + price + "</li>")
}
