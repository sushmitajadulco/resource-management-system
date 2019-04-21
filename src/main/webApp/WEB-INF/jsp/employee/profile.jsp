<!DOCTYPE html>
<html lang="en">
    <jsp:include page="../include/header.jsp"/>

    <script>
            $(document).ready(function() {
                var url = window.location.toString();
                var id = url.substring(url.lastIndexOf('/') + 1);
                $.ajax({
                   url: "/api/employee/" + id ,
                   type: "get",
                   success: function (employee) {
                      $('.employee-name').append(employee.name);
                      $('.employee-designation').append(employee.designationID);
                      $('.employee-level').append(employee.levelID);
                   }, error: function (jqXHR, textStatus, errorThrown) {},
                  });
            });
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

         <!-- Modal -->
         <div class="modal fade" id="addProjectModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
           <div class="modal-dialog" role="document">
             <div class="modal-content">
               <div class="modal-header">
                 <h5 class="modal-title" id="exampleModalLabel">Add Project</h5>
                 <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                   <span aria-hidden="true">&times;</span>
                 </button>
               </div>
               <div class="modal-body">
                   <form class="project-validation" novalidate>
                     <div class="form-group">
                       <label>Name</label>
                       <input type="input" class="form-control" placeholder="Awesome Project" required>
                       <div class="invalid-feedback">
                         Please enter a name.
                        </div>
                     </div>
                     <div class="form-group">
                       <label>Description</label>
                       <input type="input" class="form-control" placeholder="Some description">
                        <div class="valid-feedback">
                          Looks good.
                        </div>
                     </div>
                    <div class="form-group">
                       <label>Start Date</label>
                       <input id="startDate" width="276" />
                       <div class="valid-feedback">
                          Looks grat
                        </div>
                     </div>
                     <div class="form-group">
                       <label>End Date</label>
                       <input id="endDate" width="276" />
                       <div class="valid-feedback">
                          Looks good.
                       </div>
                     </div>
               </div>
               <div class="modal-footer">
                 <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                 <button type="submit" class="btn btn-primary" >Save changes</button>
               </div>
               </form>
             </div>
           </div>
         </div>

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