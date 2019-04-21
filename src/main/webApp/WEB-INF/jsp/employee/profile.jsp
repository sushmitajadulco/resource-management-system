<!DOCTYPE html>
<html lang="en">
    <jsp:include page="../include/header.jsp"/>

    <script>
            var employeeProfileId=0;

            $(document).ready(function() {
                getAllocationFormData();

                var url = window.location.toString();
                var id = url.substring(url.lastIndexOf('/') + 1);
                employeeProfileId = id;
                $.ajax({
                   url: "/api/employee/" + id ,
                   type: "get",
                   success: function (employee) {

                      $('.employee-name').append(employee.firstName).append(" ").append(employee.lastName);
                      $('.employee-designation').append(employee.designation.name);
                      $('.employee-level').append(employee.level.name);
                   }, error: function (jqXHR, textStatus, errorThrown) {},
                  });
            });

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

            var isEdit = false;
             function save() {

                   		var modelObj = {
                   				employeeId:  employeeProfileId,
                   				projectId: $('#project').val(),
                   				startDate: $("#startDate").val(),
                   				endDate: $("#endDate").val(),
                   				percentage: $("#allocation").val()
                   		};

                        console.log("modelObj: ", modelObj);
                        console.log("isEdit", isEdit);
                         var method, endPoint;
                         if( isEdit == true) {
                            method = "PUT";
                            endPoint = "/api/employee/edit/" + employeeProfileId;
                            console.log("edited");
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
                   <button type="button" class="btn btn-warning btn-sm"><i class="far fa-edit"></i></button>
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
                        <a class="nav-link active" data-toggle="tab" href="#CurrentMembers">Current Projects</a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link " data-toggle="tab" href="#PastMembers">Past Projects</a>
                      </li>
                    </ul>
              </div>

              <div class="card-body card-content">
                <div class="tab-content">
                  <div class="tab-pane container active" id="CurrentMembers">
                    <div class="table-responsive">
                        <div class="float-right">
                            <button type="button" class="btn btn-primary float-right button-margin" data-toggle="modal" data-target="#allocationModal">Add Project</button>
                         </div>
                        <table id="project-current-members" class="table table-striped table-bordered" style="width:100%">
                          <thead class="custom-table-head">
                             <tr>
                                <th>ID</th>
                                <th>Project Name</th>
                                <th>Description</th>
                                <th>Start Date</th>
                                <th>End Date</th>
                                <th>Allocation</th>
                             </tr>
                          </thead>
                          <tbody>
                            <tr>
                              <th scope="row">1</th>
                              <td>Mark</td>
                              <td>Otto</td>
                              <td>10/11/19</td>
                              <td>10/11/19</td>
                              <td></td>
                            </tr>

                          </tbody>
                        </table>
                      </div> <!-- table reponsive -->
                    </div> <!-- tab pane content current projects -->

                  <div class="tab-pane container fade" id="PastMembers">
                    <div class="table-responsive">
                        <table id="project-past-members" class="table table-striped table-bordered" style="width:100%">
                          <thead class="custom-table-head">
                             <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Description</th>
                                <th>Start Date</th>
                                <th>End Date</th>
                                <th>Action</th>
                             </tr>
                          </thead>
                          <tbody>
                            <tr>
                              <th scope="row">1</th>
                              <td>Mark</td>
                              <td>Otto</td>
                              <td>10/11/19</td>
                              <td>10/11/19</td>
                              <td>
                                 <a href="/project/profile"><button type="button" class="btn btn-primary btn-sm"><i class="far fa-clipboard"></i></button></a>
                                 <button type="button" class="btn btn-warning btn-sm"><i class="far fa-edit"></i></button>
                                 <button type="button" class="btn btn-danger btn-sm"><i class="far fa-trash-alt"></i></button>
                               </td>
                            </tr>
                            <tr>
                              <th scope="row">2</th>
                              <td>Jacob</td>
                              <td>Thornton</td>
                              <td>10/11/19</td>
                              <td>10/11/19</td>
                              <td>@fat</td>
                            </tr>
                            <tr>
                              <th scope="row">3</th>
                              <td>Larry</td>
                              <td>the Bird</td>
                              <td>10/11/19</td>
                              <td>10/11/19</td>
                              <td>@twitter</td>
                            </tr>
                            <tr>
                              <th scope="row">1</th>
                              <td>Mark</td>
                              <td>Otto</td>
                              <td>10/11/19</td>
                              <td>10/11/19</td>
                              <td>@mdo</td>
                            </tr>
                            <tr>
                              <th scope="row">2</th>
                              <td>Jacob</td>
                              <td>Thornton</td>
                              <td>10/11/19</td>
                              <td>10/11/19</td>
                              <td>@fat</td>
                            </tr>
                            <tr>
                              <th scope="row">3</th>
                              <td>Larry</td>
                              <td>the Bird</td>
                              <td>10/11/19</td>
                              <td>10/11/19</td>
                              <td>@twitter</td>
                            </tr>
                            <tr>
                              <th scope="row">1</th>
                              <td>Mark</td>
                              <td>Otto</td>
                              <td>10/11/19</td>
                              <td>10/11/19</td>
                              <td>@mdo</td>
                            </tr>
                            <tr>
                              <th scope="row">2</th>
                              <td>Jacob</td>
                              <td>Thornton</td>
                              <td>10/11/19</td>
                              <td>10/11/19</td>
                              <td>@fat</td>
                            </tr>
                            <tr>
                              <th scope="row">3</th>
                              <td>Larry</td>
                              <td>the Bird</td>
                              <td>10/11/19</td>
                              <td>10/11/19</td>
                              <td>@twitter</td>
                            </tr>
                            <tr>
                              <th scope="row">1</th>
                              <td>Mark</td>
                              <td>Otto</td>
                              <td>10/11/19</td>
                              <td>10/11/19</td>
                              <td>@mdo</td>
                            </tr>
                            <tr>
                              <th scope="row">2</th>
                              <td>Jacob</td>
                              <td>Thornton</td>
                              <td>10/11/19</td>
                              <td>10/11/19</td>
                              <td>@fat</td>
                            </tr>
                            <tr>
                              <th scope="row">3</th>
                              <td>Larry</td>
                              <td>the Bird</td>
                              <td>10/11/19</td>
                              <td>10/11/19</td>
                              <td>@twitter</td>
                            </tr>
                            <tr>
                              <th scope="row">1</th>
                              <td>Mark</td>
                              <td>Otto</td>
                              <td>10/11/19</td>
                              <td>10/11/19</td>
                              <td>@mdo</td>
                            </tr>
                            <tr>
                              <th scope="row">2</th>
                              <td>Jacob</td>
                              <td>Thornton</td>
                              <td>10/11/19</td>
                              <td>10/11/19</td>
                              <td>@fat</td>
                            </tr>
                            <tr>
                              <th scope="row">3</th>
                              <td>Larry</td>
                              <td>the Bird</td>
                              <td>10/11/19</td>
                              <td>10/11/19</td>
                              <td>@twitter</td>
                            </tr>
                            <tr>
                              <th scope="row">1</th>
                              <td>Mark</td>
                              <td>Otto</td>
                              <td>10/11/19</td>
                              <td>10/11/19</td>
                              <td>@mdo</td>
                            </tr>
                            <tr>
                              <th scope="row">2</th>
                              <td>Jacob</td>
                              <td>Thornton</td>
                              <td>10/11/19</td>
                              <td>10/11/19</td>
                              <td>@fat</td>
                            </tr>
                            <tr>
                              <th scope="row">3</th>
                              <td>Larry</td>
                              <td>the Bird</td>
                              <td>10/11/19</td>
                              <td>10/11/19</td>
                              <td>@twitter</td>
                            </tr>
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