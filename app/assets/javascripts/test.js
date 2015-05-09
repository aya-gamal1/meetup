$(function() {
   
    
  $("#datepicker").datepicker({
			   onSelect: function(dateText, inst) {

			      var dateAsString = dateText; //the first parameter of this function
			      var dateAsObject = $(this).datepicker( 'getDate' ); //the getDate method
			      console.log(dateAsString);
			      $.ajax({
  type: "GET",
  url: "/events/find",
  dataType: "JSON",
  data: { 'date':dateAsString },
  success: function(data) {
    console.log(data);
  }
});
			   }
			});

  });
