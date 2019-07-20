$(document).ready(function(){
  $('#hospital_name').keydown(function() {
      
      $.ajax({
         url: '<%= update_subdomain_url %>',
         method: "POST",
         data: {
             hospital_name: $("#hospital_name").val()
         },
         dataType: "script"
      });
  });
});