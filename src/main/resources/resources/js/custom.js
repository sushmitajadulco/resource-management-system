


$(document).ready(function() {


//                 $.ajax({
//                	        url: "/api/project/list",
//                	        type: "GET",
//                	        success: function (data) {
//                                for(var i=0;i < data.length; i++) {
//                                    console.log(data[i].id);
//                                    console.log(data[i].name);
//                                }
//                                $('#project-table').append(data);
//                	        }, error: function (jqXHR, textStatus, errorThrown) {
//                	        }
//                		});

  $('#employee-table').DataTable();

  $('#project-past-members').DataTable();

  $('#project-current-members').DataTable();


  function post(path, params, method) {
              	method = method || "post";

              	var form = document.createElement("form");
              	form.setAttribute("method", method);
              	form.setAttribute("action", path);

              	for ( var key in params) {
              		if (params.hasOwnProperty(key)) {
              			var hiddenField = document.createElement("input");
              			hiddenField.setAttribute("type", "hidden");
              			hiddenField.setAttribute("name", key);
              			hiddenField.setAttribute("value", params[key]);

              			form.appendChild(hiddenField);
              		}
              	}

              	document.body.appendChild(form);
              	form.submit();

              }


            var table = $('#projectsTable').DataTable({
               			"sAjaxSource": "/api/project/list",
               			"sAjaxDataProp": "",
               			"order": [[ 0, "asc" ]],
               			"aoColumns": [
               			    { "mData": "id"},
               		         { "mData": "name" },
               				  { "mData": "description" },
               				  { "mData": "startDate" },
               				  { "mData": "endDate" },
               				  {"defaultContent": "<button id='view' type='button' class='btn btn-primary btn-sm'><i class='fas fa-envelope-open-text'></i></button>" +
               				                     "<button id='edit' type='button' class='btn btn-warning btn-sm'><i class='fas fa-pencil-alt' style='color: white'></i></button>" +
               				                     "<button id='delete' type='button' class='btn btn-danger btn-sm'><i class='far fa-trash-alt'></i></button>"
               				  }
               			]
               	 });


               	 $('#projectsTable tbody').on( 'click', 'button#view', function () {
               	         var data = table.row( $(this).parents('tr') ).data();
               	         location.href="/project" + data.id
                  } );

                 $('#projectsTable tbody').on( 'click', 'button#edit', function () {

                         var data = table.row( $(this).parents('tr') ).data();
                         location.href="/project/edit/ " + data.id
                   } );

                 $('#projectsTable tbody').on( 'click', 'button#delete', function () {

                       var data = table.row( $(this).parents('tr') ).data();
                       post('/api/project/delete/' + data.id);
                  } );


  $('#startDate').datepicker({
   uiLibrary: 'bootstrap4'
  });
  $('#endDate').datepicker({
   uiLibrary: 'bootstrap4'
  });

  $('.dynamicStartDate').datepicker({
    uiLibrary: 'bootstrap4'
  });
  $('.dynamicEndDate').datepicker({
    uiLibrary: 'bootstrap4'
  });

  $('[data-toggle="tooltip"]').tooltip();



});



//Clone the hidden element and shows it
$('.add-one').click(function(){
  $('.dynamic-element').first().clone().appendTo('.dynamic-add-project').show();
  attach_delete();

});

$('body').on('focus',".endDate", function(){
    $(this).datetimepicker({
      format: 'DD/MM/YYYY',
      ignoreReadonly: true,
      showTodayButton: true
  });
});

//Attach functionality to delete buttons
function attach_delete(){
  $('.delete').off();
  $('.delete').click(function(){
    console.log("click");
    $(this).closest('.form-group').remove();
  });
}


(function() {
  'use strict';
  window.addEventListener('load', function() {
      // Fetch all the forms we want to apply custom Bootstrap validation styles to
      var forms = document.getElementsByClassName('project-validation');
       // Loop over them and prevent submission
      var validation = Array.prototype.filter.call(forms, function(form) {
          form.addEventListener('submit', function(event) {
              if (form.checkValidity() === false) {
                event.preventDefault();
                event.stopPropagation();
              }
              form.classList.add('was-validated');
          }, false);
        });
      }, false);
})();


(function() {
  'use strict';
  window.addEventListener('load', function() {
      // Fetch all the forms we want to apply custom Bootstrap validation styles to
      var forms = document.getElementsByClassName('employee-validation');
       // Loop over them and prevent submission
      var validation = Array.prototype.filter.call(forms, function(form) {
          form.addEventListener('submit', function(event) {
              if (form.checkValidity() === false) {
                event.preventDefault();
                event.stopPropagation();
              }
              form.classList.add('was-validated');
          }, false);
        });
      }, false);
})();




