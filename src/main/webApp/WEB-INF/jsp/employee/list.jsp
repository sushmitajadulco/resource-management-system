<!DOCTYPE html>
<html lang="en">
    <jsp:include page="../include/header.jsp"/>

    <body>
        <main role="main">
          <div class="container">
            <div class="card card-list">
              <div class="card-header">
                <div class="float-left">
                    <h4>List of Employees</h4>
                </div>
                <div class="float-right">
                   <button class="btn btn-primary float-right" data-toggle="modal" data-target="#addEmployeeModal" type="submit">Add Employee</button>
                </div>
              </div>

              <div class="card-body card-content">
                <div class="table-responsive">
                    <table id="employee-table" class="table table-striped table-bordered" style="width:100%">
                      <thead class="custom-table-head">
                         <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Designation</th>
                            <th>Level</th>
                            <th>Action</th>
                         </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <th scope="row">1</th>
                          <td>Sushmita</td>
                          <td>Java Developer</td>
                          <td>1</td>
                          <td>
                          <button type="button" class="btn btn-primary btn-sm"><i class="fas fa-user"></i></button>
                          <button type="button" class="btn btn-warning btn-sm"><i class="fas fa-pencil-alt" style="color: white"></i></button>
                          <button type="button" class="btn btn-danger btn-sm"><i class="far fa-trash-alt"></i></button>
                          </td>
                        </tr>
                        <tr>
                          <th scope="row">2</th>
                          <td>Bea</td>
                          <td>Java Developer</td>
                          <td>1</td>
                          <td>
                          <button type="button" class="btn btn-primary btn-sm"><i class="fas fa-user"></i></button>
                          <button type="button" class="btn btn-warning btn-sm"><i class="fas fa-pencil-alt" style="color: white"></i></button>
                          <button type="button" class="btn btn-danger btn-sm"><i class="far fa-trash-alt"></i></button>
                          </td>
                        </tr>
                        <tr>
                          <th scope="row">3</th>
                          <td>Perf</td>
                          <td>Java Developer</td>
                          <td>1</td>
                          <td>
                          <button type="button" class="btn btn-primary btn-sm"><i class="fas fa-user"></i></button>
                          <button type="button" class="btn btn-warning btn-sm"><i class="fas fa-pencil-alt" style="color: white"></i></button>
                          <button type="button" class="btn btn-danger btn-sm"><i class="far fa-trash-alt"></i></button>
                          </td>
                        </tr>
                        <tr>
                          <th scope="row">4</th>
                          <td>Alfred</td>
                          <td>Java Developer</td>
                          <td>1</td>
                          <td>
                          <button type="button" class="btn btn-primary btn-sm"><i class="fas fa-user"></i></button>
                          <button type="button" class="btn btn-warning btn-sm"><i class="fas fa-pencil-alt" style="color: white"></i></button>
                          <button type="button" class="btn btn-danger btn-sm"><i class="far fa-trash-alt"></i></button>
                          </td>
                        </tr>
                        <tr>
                           <th scope="row">5</th>
                           <td>Christian</td>
                           <td>Java Developer</td>
                           <td>1</td>
                           <td>
                           <button type="button" class="btn btn-primary btn-sm"><i class="fas fa-user"></i></button>
                           <button type="button" class="btn btn-warning btn-sm"><i class="fas fa-pencil-alt" style="color: white"></i></button>
                           <button type="button" class="btn btn-danger btn-sm"><i class="far fa-trash-alt"></i></button>
                           </td>
                         </tr>
                         <tr>
                           <th scope="row">6</th>
                           <td>Mark Otto</td>
                           <td>Java Developer</td>
                           <td>1</td>
                           <td>
                           <button type="button" class="btn btn-primary btn-sm"><i class="fas fa-user"></i></button>
                           <button type="button" class="btn btn-warning btn-sm"><i class="fas fa-pencil-alt" style="color: white"></i></button>
                           <button type="button" class="btn btn-danger btn-sm"><i class="far fa-trash-alt"></i></button>
                           </td>
                         </tr>
                         <tr>
                           <th scope="row">7</th>
                           <td>Mark Otto</td>
                           <td>Java Developer</td>
                           <td>1</td>
                           <td>
                           <button type="button" class="btn btn-primary btn-sm"><i class="fas fa-user"></i></button>
                           <button type="button" class="btn btn-warning btn-sm"><i class="fas fa-pencil-alt" style="color: white"></i></button>
                           <button type="button" class="btn btn-danger btn-sm"><i class="far fa-trash-alt"></i></button>
                           </td>
                         </tr>
                      </tbody>
                    </table>
                   </div> <!-- table reponsive -->
                 </div> <!-- card-body -->
               </div> <!-- card -->
            </div> <!-- container -->
         </main

          <!-- Modal -->
         <div class="modal fade" id="addEmployeeModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
           <div class="modal-dialog modal-lg" role="document">
             <div class="modal-content">
               <div class="modal-header">
                 <h5 class="modal-title" id="exampleModalLabel">Add Employee</h5>
                 <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                   <span aria-hidden="true">&times;</span>
                 </button>
               </div>
               <div class="modal-body">
                   <form class="employee-validation" novalidate>
                     <div class="form-group">
                       <label>Name</label>
                       <input type="input" class="form-control" placeholder="Full Name" required>
                       <div class="invalid-feedback">
                         Please enter a name.
                        </div>
                     </div>
                     <div class="form-group">
                       <label>Designation</label>
                       <input type="input" class="form-control" placeholder="Java Developer">
                        <div class="valid-feedback">
                          Looks good.
                        </div>
                     </div>
                     <div class="form-group">
                       <label>Level</label>
                       <input type="input" class="form-control" placeholder="1">
                        <div class="valid-feedback">
                          Looks good.
                        </div>
                     </div>


                     <label>Project(s):</label>
                     <div class="dynamic-add-project">
                          <!-- Dynamic element will be cloned here -->
                          <!-- You can call clone function once if you want it to show it a first element-->
                      </div>
                      <div>
                        <button type="button" class="btn btn-primary btn-sm add-one">+ add Project</button>
                      </div>

                    </form>


                    <!-- Hidden element to clone -->
                     <div class="form-group dynamic-element" style="display:none">
                        <div class="row">
                          <div class="col-md-4 ">
                            <select class="form-control">
                              <option>Artemis</option>
                              <option>Rax</option>
                              <option>Opentides</option>
                              <option>Attache</option>
                              <option>Gamify</option>
                            </select>
                          </div>

                          <div class="col-md-3 ">
                             <input class="dynamicStartDate" width="160" name="startDate" placeholder="Start Date"/>
                             <div class="valid-feedback">
                                Looks great
                              </div>
                           </div>

                           <!-- <div class="col-md-3">
                             <input class="dynamicEndDate" width="160" name="endDate" placeholder="End Date"/>
                             <div class="valid-feedback">
                                Looks good.
                             </div>
                           </div> -->

                          <div class="col-md-3">
                            <input type="text" data-date-format="mm/dd/yyyy" class="form-control endDate" placeholder="End Date">
                            <div class="input-group-appemd">
                              <span class="input-group-text"><i class="fa fa-calendar"></i></span>
                            </div>
                          </div>

                           <div class="col-md-1">
                            <button type="button" class="btn btn-danger btn-sm delete"><i class="far fa-trash-alt"></i></button>
                          </div>
                        </div> <!--row-->
                      </div> <!-- dynamic-element -->
                    </div> <!-- modal body -->
                <div class="modal-footer">
                   <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                   <button type="submit" class="btn btn-primary" >Save changes</button>
                </div>
             </div> <!--modal-content-->
           </div> <!--modal-dialog -->
         </div> <!--modal -->


        <jsp:include page="../include/script.jsp"/>
     </body>
</html>