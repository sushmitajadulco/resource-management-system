<!DOCTYPE html>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html lang="en">
    <jsp:include page="../include/header.jsp"/>
    <script>
        var isEdit = false;
        var id;

        $(document).ready(function() {
             var url = window.location.toString();
             id = url.substring(url.lastIndexOf('/') + 1);
             getFormData();
             if(isNaN(id)) {
                $('.title').append("Add Employee");
             } else {
                $('.title').append("Edit Employee");
                getEmployee();
                isEdit = true;
             }
        });

        function getEmployee() {
            var url = window.location.toString();
                        var id = url.substring(url.lastIndexOf('/') + 1);
                        $.ajax({
                           url: "/api/employee/" + id ,
                           type: "get",
                           success: function (employee) {
                               console.log("employee: ", employee);
                              $('#firstName').val(employee.firstName);
                              $('#lastName').val(employee.lastName);
                              $('#designation').val(employee.designation.id);
                              $('#level').val(employee.level.id);
                           }, error: function (jqXHR, textStatus, errorThrown) {},
             });

        }

       function save() {

       		var modelObj = {
       				firstName:  $('#firstName').val(),
       				lastName: $('#lastName').val(),
       				designationId: $("#designation").val(),
       				levelId: $("#level").val()
       		};

            console.log("modelObj: ", modelObj);
            console.log("isEdit", isEdit);
             var method, endPoint;
             if( isEdit == true) {
                method = "PUT";
                endPoint = "/api/employee/edit/" + id;
                console.log("edited");
             } else {
                method = "POST";
                endPoint = "/api/employee/add";
             }
       		 $.ajax({
       	            type: method,
       	            url: endPoint,
       	            headers: {
       	                "Content-Type": "application/json"
       	            },
       	            data: JSON.stringify(modelObj),
       	            success: function (data) {
                        localStorage.setItem("modalId", "#successModal");
       	            },
       	            error: function (jqXHR, textStatus, errorThrown) {
       	                localStorage.setItem("modalId", "#errorModal");
       	            },
       	            complete: function() {
       	                location.href="/employee/list";
       	            }

       	        });
       	}

        function getFormData() {
            let designation = $('#designation');
            let level = $('#level');

            designation.empty();
            level.empty();
            designation.prop('selectedIndex', 0);
            level.prop('selectedIndex', 0);

            const designation_url = '/api/designation/list';
            const level_url = '/api/level/list';

            // Populate dropdowns with list of designations and levels
            $.getJSON(designation_url, function (data) {
                $.each(data, function (key, entry) {
                    designation.append($('<option></option>').attr('value', entry.id).text(entry.name));
                })
            });
            $.getJSON(level_url, function (data) {
                 $.each(data, function (key, entry) {
                     level.append($('<option></option>').attr('value', entry.id).text(entry.name));
                 })
             });
        }


    </script>

    <body>
        <main role="main">
          <div class="container">
            <div class="card card-list">
                <div class="card-header">
                    <div class="float-left">
                       <h4 class="title"></h4>
                    </div>
                    <div class="float-right">
                       <button type="button" class="btn btn-primary float-right" onclick="location.href='/employee/list/'">Back</button>
                    </div>
                </div>

                <div class="card-body card-content">
                    <form id="employeeForm" class="employee-validation"  novalidate="true">
                     <div class="form-group">
                       <label>First Name</label>
                       <input id="firstName" type="input" class="form-control" placeholder="First name" required="true"/>
                       <div class="invalid-feedback">
                         Please enter first name.
                       </div>
                     </div>
                     <div class="form-group">
                         <label>Last Name</label>
                         <input id="lastName" type="input" class="form-control" placeholder="Last name" required="true"/>
                         <div class="invalid-feedback">
                            Please enter last name.
                         </div>
                     </div>
                    <div class="form-group">
                       <label>Designation</label>
                       <select class="form-control" id="designation"></select>
                        <div class="invalid-feedback">
                           Looks good.
                        </div>
                     </div>
                    <div class="form-group">
                       <label>Level</label>
                        <select class="form-control" id="level"></select>
                       <div class="valid-feedback">
                          Looks good.
                       </div>
                     </div>
                     <button type="button" class="btn btn-primary float-right" onclick="save()">Save</button>
                  </form>
               </div>
                </div> <!-- card-body -->
               </div> <!-- card -->
            </div> <!-- container -->
         </main>

        <jsp:include page="../include/script.jsp"/>
     </body>
</html>


