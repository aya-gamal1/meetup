$(function() {
var interest="";
var intid="";
$(".div1").click(function(){

var text=$(this).children().remove().end().text();
var id=$(this).attr('id');
$(this).remove();
console.log(id);

interest=text+','+interest;
intid=id+','+intid;
$.ajax({
  type: "get",
  url: "/groups/new",
  dataType: "JSON",
  data: { 'data': interest,'id':intid },
  complete: function(data)
  {
var array = JSON.parse( data.responseText );

    console.log(typeof(array));
    $(".text").val(array[0]);
    $(".id").val(array[1]);
    console.log(array[1]);
  }
});









})




});

