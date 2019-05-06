<!DOCTYPE html>
<html lang="en">
    <jsp:include page="../include/header.jsp"/>

    <script>
            var employeeProfileId = 0;
            var isEdit = false;
            var allocationId = 0;

            $(document).ready(function() {
                getAllocationFormData();

                var url = window.location.toString();
                var id = url.substring(url.lastIndexOf('/') + 1);
                employeeProfileId = id;
                $.ajax({
                   url: "/api/employee/" + id,
                   type: "get",
                   success: function (employee) {
                      $('.employee-name').append(employee.firstName).append(" ").append(employee.lastName);
                      $('.employee-designation').append(employee.designation.name);
                      $('.employee-level').append(employee.level.name);
                   }, error: function (jqXHR, textStatus, errorThrown) {},
                  });

                var table = $('#currentProjects').DataTable({
                    "sAjaxSource": "/api/allocation/current/list/" + employeeProfileId,
                    "sAjaxDataProp": "",
                    "order": [[ 0, "desc" ]],
                    "aoColumns": [
                    { "mData": "id"},
                    { "mData": "project.name" },
                    { "mData": "project.description" },
                    { "mData": "startDate" },
                    { "mData": "endDate" },
                    { "mData": "percentage" },
                    {"defaultContent": "<button id='archive' type='button' class='btn btn-primary btn-sm'><i class='fas fa-user-times' style='color: white'></i></button>" +
                    "<button id='edit' type='button' class='btn btn-warning btn-sm'><i class='fas fa-pencil-alt' style='color: white'></i></button>" +
                    "<button id='delete' type='button' class='btn btn-danger btn-sm'><i class='far fa-trash-alt'></i></button>"
                    }
                    ]
                });

                $('#currentProjects tbody').on( 'click', 'button#archive', function () {
                    var data = table.row( $(this).parents('tr') ).data();
                    archiveAllocation(data);
                } );

                 $('#currentProjects tbody').on( 'click', 'button#edit', function () {
                    isEdit = true;
                    var data = table.row( $(this).parents('tr') ).data();
                    allocationId = data.id;
                    $("#allocationModal").modal();
                    getAllocation();
                } );

                 $('#currentProjects tbody').on( 'click', 'button#delete', function () {
                  var data = table.row( $(this).parents('tr') ).data();
                  deleteProject('/api/project/delete/' + data.id);
                });
            });

            function archiveAllocation(data) {
                    console.log("data: ", data);
                    console.log("data.project.id: ", data.project.id);
                    var obj = {
                        employeeId: employeeProfileId,
                        projectId: data.project.id,
                        startDate: data.startDate,
                        endDate: data.endDate,
                        percentage: data.percentage,
                        current: false
                     }
                     console.log("obj", obj);
                    $.ajax({
                        type: "PUT",
                        url: "/api/employee/editAllocation/" + data.id,
                        headers: {
                            "Content-Type": "application/json"
                        },
                        data: JSON.stringify(obj),
                        success: function (data) {
                            console.log("success");
                            localStorage.setItem("modalId", "#successModal");
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            localStorage.setItem("modalId", "#errorModal");
                        },
                        complete: function() {
                            //location.href="/employee/profile/" + employeeProfileId;
                        }
                    });
            }

            function getAllocation(id) {
                        $.ajax({
                           url: "/api/allocation/" + allocationId,
                           type: "get",
                           success: function (allocation) {
                              console.log("allocation: ", allocation);
                              console.log("allocation.project.name: ", allocation.project.name);
                              $('#project').val(allocation.project.id);
                              $('#startDate').val(allocation.startDate);
                              $('#endDate').val(allocation.endDate);
                              $('#allocation').val(allocation.percentage);
                           }, error: function (jqXHR, textStatus, errorThrown) {},
                        });
            }

            function getPastProjects() {
                var table = $('#pastProjects').DataTable({
                    "sAjaxSource": "/api/allocation/past/list/" + employeeProfileId,
                    "sAjaxDataProp": "",
                    "order": [[ 0, "desc" ]],
                    "aoColumns": [
                    { "mData": "id"},
                    { "mData": "project.name" },
                    { "mData": "project.description" },
                    { "mData": "startDate" },
                    { "mData": "endDate" },
                    { "mData": "percentage" },
                    {"defaultContent":
                    "<button id='edit' type='button' class='btn btn-warning btn-sm'><i class='fas fa-pencil-alt' style='color: white'></i></button>"
                    }
                    ]
                });
            }

            function getAllocationFormData() {
                let project = $('#project');
                let allocation = $('#allocation');

                project.empty();
                allocation.empty();
                project.prop('selectedIndex', 0);
                allocation.prop('selectedIndex', 0);

                const project_url = '/api/project/list';
                const allocation_percentage = [
                    {"name":"ZERO", "value": 0.0},
                    {"name":"TWENTY_FIVE", "value": 0.25},
                    {"name":"FIFTY", "value": 0.5},
                    {"name":"SEVENTY_FIVE", "value": 0.75},
                    {"name":"ONE", "value": 1.0}
                ];

                // Populate dropdowns with list of designations and levels
                $.getJSON(project_url, function (data) {
                    $.each(data, function (key, entry) {
                        project.append($('<option></option>').attr('value', entry.id).text(entry.name));
                    })
                });

                $.each(allocation_percentage, function (key, entry) {
                    allocation.append($('<option></option>').attr('value', entry.name).text(entry.value));
                });

            }


             function saveAllocation() {
                        console.log("isEdit: ", isEdit);
                   		var modelObj = {
                   				employeeId:  employeeProfileId,
                   				projectId: $('#project').val(),
                   				startDate: $("#startDate").val(),
                   				endDate: $("#endDate").val(),
                   				percentage: $("#allocation").val(),
                   				isCurrent: true
                   		};

                        console.log("modelObj: ", modelObj);
                        console.log("isEdit", isEdit);
                         var method, endPoint;

                         if( isEdit == true) {
                            method = "PUT";
                            endPoint = "/api/employee/editAllocation/" + allocationId;
                            isEdit = false;
                         } else {
                            method = "POST";
                            endPoint = "/api/employee/addAllocation";
                         }
                   		 $.ajax({
                   	            type: method,
                   	            url: endPoint,
                   	            headers: {
                   	                "Content-Type": "application/json"
                   	            },
                   	            data: JSON.stringify(modelObj),
                   	            success: function (data) {
                   	                $('#warning-msg').hide();
                   	                $('#allocationModal').modal('hide');
                                    localStorage.setItem("modalId", "#successModal");
                                    //location.href="/employee/profile/" + employeeProfileId;
                   	            },
                   	            error: function (jqXHR, textStatus, errorThrown) {
                   	                //localStorage.setItem("modalId", "#errorModal");
                   	                $('#warning-msg').show();
                   	            },

                   	        });
                   	}


    </script>

    <body>
        <main role="main">
          <div class="container">
            <div class="card project-profile">
              <div class="card-header">
               <div class="float-left">
                    <h4>Employee Profile</h4>
                </div>
                <div class="float-right">
                   <button type='button' class='btn btn-warning btn-sm'><i class='fas fa-pencil-alt' style='color: white'></i></button>
                   <button type="button" class="btn btn-danger btn-sm"><i class="far fa-trash-alt"></i></button>
                </div>
              </div>
              <div class="card-body profile-info">
                <div class="row">
                  <div class="col col-md-2"><i class="fas fa-user-circle fa-8x"></i></div>
                  <div class="col col-md-2">
                    <p>Name:</p>
                    <p>Designation:</p>
                    <p>Level:</p>
                  </div>
                  <div class="col col-md-8">
                    <p class="employee-name"></p>
                    <p class="employee-designation"></p>
                    <p class="employee-level"></p>
                  </div>
                </div>
              </div>
            </div>


            <!-- Current and Past members tables in tabs -->
            <div class="card card-list">
              <div class="card-header">
                <ul class="nav nav-tabs card-header-tabs">
                      <li class="nav-item">
                        <a class="nav-link active" data-toggle="tab" href="#currentProjectsTab" >Current Projects</a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link " data-toggle="tab" href="#pastProjectsTab" onclick="getPastProjects()">Past Projects</a>
                      </li>
                    </ul>
              </div>

              <div class="card-body card-content">
                <div class="tab-content">
                  <div class="tab-pane container active" id="currentProjectsTab">
                    <div class="table-responsive">
                        <div class="float-right">
                            <button type="button" class="btn btn-primary float-right button-margin" data-toggle="modal" data-target="#allocationModal">Add Allocation</button>
                         </div>
                        <table id="currentProjects" class="table table-striped table-bordered" style="width:100%">
                          <thead class="custom-table-head">
                             <tr>
                                <th>ID</th>
                                <th>Project Name</th>
                                <th>Project Description</th>
                                <th>Start Date</th>
                                <th>End Date</th>
                                <th>Allocation</th>
                                <th>Actions</th>
                             </tr>
                          </thead>
                          <tbody></tbody>
                        </table>
                      </div> <!-- table reponsive -->
                    </div> <!-- tab pane content current projects -->

                  <div class="tab-pane container fade" id="pastProjectsTab">
                    <div class="table-responsive">
                        <table id="pastProjects" class="table table-striped table-bordered" style="width:100%">
                          <thead class="custom-table-head">
                             <tr>
                                <th>ID</th>
                                <th>Project Name</th>
                                <th>Project Description</th>
                                <th>Start Date</th>
                                <th>End Date</th>
                                <th>Allocation</th>
                                <th>Actions</th>
                             </tr>
                          </thead>
                          <tbody>

                          </tbody>
                        </table>
                      </div> <!-- table reponsive -->
                    </div> <!-- tab pane content current projects -->
                   </div> <!-- tab content -->
                 </div> <!-- card-body -->
               </div> <!-- card -->
            </div> <!-- container -->
         </main>


        <jsp:include page="../allocation/form.jsp"/>
        <jsp:include page="../include/script.jsp"/>
        <script>
        // Example starter JavaScript for disabling form submissions if there are invalid fields
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
        </script>
     </body>
</html>