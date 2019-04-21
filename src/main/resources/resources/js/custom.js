



$(document).ready(function() {

  $('#project-past-members').DataTable();

  $('#project-current-members').DataTable();

  $('#startDate').datepicker({
   uiLibrary: 'bootstrap4',
   format: 'yyyy-mm-dd'
  });

  $('#endDate').datepicker({
   uiLibrary: 'bootstrap4',
   format: 'yyyy-mm-dd'
  });

  $('.dynamicStartDate').datepicker({
    uiLibrary: 'bootstrap4'
  });
  $('.dynamicEndDate').datepicker({
    uiLibrary: 'bootstrap4'
  });

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




