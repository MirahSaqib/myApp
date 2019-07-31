$(document).ready(function() {
	$('#prescription_medicine_tokens').tokenInput('/medicines.json', { 
		theme: "facebook",
    onAdd: function(medicine) {
      var item = medicine;
      $.ajax({
         url: '/add_medicine',
         method: "POST",
         data: {
             item: item
         },
         dataType: "script"
      });
    },
    onDelete: function(medicine) {
      var item = medicine;
      $.ajax({
         url: '/delete_medicine',
         method: "POST",
         data: {
             item: item
         },
         dataType: "script"
      });
    },
    preventDuplicates: true,
    prePopulate: $('#prescription_medicine_tokens').data('load')
	});
});


